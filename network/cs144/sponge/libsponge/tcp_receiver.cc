#include "tcp_receiver.hh"

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

void TCPReceiver::segment_received(const TCPSegment &seg) {
    if (seg.header().syn)
        _isn.emplace(seg.header().seqno);
    if (!_isn.has_value())
        return;

    uint64_t _check_point = _reassembler.stream_out().bytes_written() + 1;
    uint64_t _abs_seqno = unwrap(seg.header().seqno, _isn.value(), _check_point);
    uint64_t _index = _abs_seqno - !seg.header().syn;
    _reassembler.push_substring(seg.payload().copy(), _index, seg.header().fin);
}

optional<WrappingInt32> TCPReceiver::ackno() const {
    if (!_isn.has_value())
        return nullopt;
    uint64_t _abs_seqno = _reassembler.stream_out().bytes_written() + 1;
    if (_reassembler.stream_out().input_ended())
        _abs_seqno++;
    return wrap(_abs_seqno, _isn.value());
}

size_t TCPReceiver::window_size() const { return _reassembler.stream_out().remaining_capacity(); }
