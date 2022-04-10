#include "tcp_sender.hh"

#include "tcp_config.hh"

#include <algorithm>
#include <random>
#include <stdlib.h>
#include <unistd.h>

// Dummy implementation of a TCP sender

// For Lab 3, please replace with a real implementation that passes the
// automated checks run by `make check_lab3`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

//! \param[in] capacity the capacity of the outgoing byte stream
//! \param[in] retx_timeout the initial amount of time to wait before retransmitting the oldest outstanding segment
//! \param[in] fixed_isn the Initial Sequence Number to use, if set (otherwise uses a random ISN)
TCPSender::TCPSender(const size_t capacity, const uint16_t retx_timeout, const std::optional<WrappingInt32> fixed_isn)
    : _isn(fixed_isn.value_or(WrappingInt32{random_device()()}))
    , _initial_retransmission_timeout{retx_timeout}
    , _stream(capacity)
    , rto(_initial_retransmission_timeout) {}

void TCPSender::fill_window() {
    // syn-send
    if (next_seqno_absolute() == 0) {
        TCPSegment tcpSegment;
        tcpSegment.header().syn = true;
        send_noempty_segment(tcpSegment, 0);
        return;
    }
    // syn-noacked
    if (next_seqno_absolute() > 0 && next_seqno_absolute() == bytes_in_flight())
        return;

    if (_outstanding_segment.size() != 0)
        _timer_running = true;

    // keep sending
    size_t pos = unwrap(_ackno.value(), _isn, _next_seqno) + _window_size;
    while (_window_size && !stream_in().buffer_empty() && !_flag_fin) {
        TCPSegment tcpSegment;
        if (pos <= _next_seqno)
            break;
        size_t remain = min(pos - _next_seqno, TCPConfig::MAX_PAYLOAD_SIZE);
        send_noempty_segment(tcpSegment, remain);
    }
    // 发送fin 是否有剩余窗口
    if (pos > _next_seqno && _flag_fin == false && stream_in().eof() && stream_in().buffer_empty()) {
        _flag_fin = true;
        TCPSegment tcpSegment;
        tcpSegment.header().fin = true;
        send_noempty_segment(tcpSegment, 0);
    }

    for (auto it : _outstanding_segment) {
        uint64_t _ackno_absolute = unwrap(_ackno.value(), _isn, _next_seqno);
        uint64_t _end_index = unwrap(it.header().seqno, _isn, _next_seqno) + it.length_in_sequence_space();
        if (_end_index <= _ackno_absolute) {
            _outstanding_segment.pop_front();
            restart(_initial_retransmission_timeout);
            _consecutive_retransmissions_num = 0;
        } else
            break;
    }
    if (_outstanding_segment.size() == 0)
        _timer_running = false;
}

//! \param ackno The remote receiver's ackno (acknowledgment number)
//! \param window_size The remote receiver's advertised window size
void TCPSender::ack_received(const WrappingInt32 ackno, const uint16_t window_size) {
    uint64_t ackno_absolute = unwrap(ackno, _isn, _next_seqno);
    if (ackno_absolute > _next_seqno)
        return;
    if (_ackno.has_value() && ackno_absolute < (unwrap(_ackno.value(), _isn, _next_seqno)))
        return;
    _ackno = ackno;
    _window_size = window_size ? window_size : 1;
    _window_zero = window_size ? false : true;
}

//! \param[in] ms_since_last_tick the number of milliseconds since the last call to this method
void TCPSender::tick(const size_t ms_since_last_tick) {
    _time_passed += ms_since_last_tick;
    if (_timer_running == true && _time_passed >= rto) {
        _segments_out.push(_outstanding_segment.front());
        _consecutive_retransmissions_num++;
        rto = _window_zero == false ? rto * 2 : rto;
        restart(rto);
    }
}

unsigned int TCPSender::consecutive_retransmissions() const { return _consecutive_retransmissions_num; }

void TCPSender::send_empty_segment() {
    TCPSegment tcpSegment;
    tcpSegment.header().seqno = wrap(_next_seqno, _isn);
    _segments_out.push(tcpSegment);
}

void TCPSender::send_noempty_segment(TCPSegment &tcpSegment, size_t remain) {
    tcpSegment.header().seqno = wrap(_next_seqno, _isn);
    Buffer _payload(stream_in().read(remain));
    tcpSegment.payload() = _payload;

    _timer_running = _payload.size() || tcpSegment.header().syn || tcpSegment.header().fin;
    _next_seqno += tcpSegment.length_in_sequence_space();

    if (stream_in().eof() == true && _flag_fin == false &&
        unwrap(_ackno.value(), _isn, _next_seqno) + _window_size > _next_seqno) {
        tcpSegment.header().fin = true;
        _flag_fin = true;
        _next_seqno += 1;
    }

    _segments_out.push(tcpSegment);
    _outstanding_segment.push_back(tcpSegment);
}

size_t TCPSender::bytes_in_flight() const {
    if (_ackno.has_value())
        return _next_seqno - unwrap(_ackno.value(), _isn, _next_seqno);
    else
        return next_seqno_absolute();
}

void TCPSender::restart(int value) {
    rto = value;
    _timer_running = _outstanding_segment.size();
    _time_passed = 0;
}
