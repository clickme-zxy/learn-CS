#include "stream_reassembler.hh"

#include <iostream>

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in
// `stream_reassembler.hh`

template <typename... Targs> void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;
// 实际上是一个共享缓冲区
StreamReassembler::StreamReassembler(const size_t capacity)
    : _output(capacity), _capacity(capacity) {}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index,
                                       const bool eof) {
  if (_output.bytes_read() + _capacity <= index)
    return;
  if (_unassemble[index].size() < data.size())
    _unassemble[index] = data;

  if (eof == true) {
    _flag_end = true;
    _end_index = index + data.size();
  }

  auto it = _unassemble.begin();
  for (; it != _unassemble.end(); it++) {
    if (it->first <= _unassemble_index) {
      if (it->second.size() + it->first <= _unassemble_index)
        continue;
      else {
        size_t len = _unassemble_index - it->first;
        _unassemble_index +=
            _output.write(it->second.substr(len, it->second.size() - len));
      }
    } else
      break;
  }
  _unassemble.erase(_unassemble.begin(), it);

  if (_flag_end == true && _unassemble_index >= _end_index)
    _output.end_input();
}

size_t StreamReassembler::unassembled_bytes() const {
  size_t len = 0, end = _unassemble_index;
  for (auto it = _unassemble.begin(); it != _unassemble.end(); it++) {
    if (it->first <= end) {
      if (it->first + it->second.size() <= end)
        continue;
      else {
        len += it->second.size() - (end - it->first);
        end = it->first + it->second.size();
      }
    } else {
      len += it->second.size();
      end = it->first + it->second.size();
    }
  }
  return len;
}

bool StreamReassembler::empty() const {
  return _unassemble.empty() && _output.buffer_empty();
}
