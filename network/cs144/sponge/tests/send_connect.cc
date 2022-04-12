#include "sender_harness.hh"
#include "wrapping_integers.hh"

#include <cstdint>
#include <cstdlib>
#include <exception>
#include <iostream>
#include <optional>
#include <stdexcept>
#include <string>

using namespace std;

int main() {
  try {
    auto rd = get_random_generator();

    {
      TCPConfig cfg;
      WrappingInt32 isn(rd());
      cfg.fixed_isn = isn;
      TCPSenderTestHarness test{"SYN sent test", cfg};
      test.execute(ExpectState{TCPSenderStateSummary::SYN_SENT});
      printf("1\n");
      test.execute(ExpectSegment{}
                       .with_no_flags()
                       .with_syn(true)
                       .with_payload_size(0)
                       .with_seqno(isn));
      printf("2\n");
      test.execute(ExpectBytesInFlight{1});
    }

    {
      TCPConfig cfg;
      WrappingInt32 isn(rd());
      cfg.fixed_isn = isn;
      printf("22\n");
      TCPSenderTestHarness test{"SYN acked test", cfg};
      printf("11\n");
      test.execute(ExpectState{TCPSenderStateSummary::SYN_SENT});
      printf("12\n");
      test.execute(ExpectSegment{}
                       .with_no_flags()
                       .with_syn(true)
                       .with_payload_size(0)
                       .with_seqno(isn));
      printf("13\n");
      test.execute(ExpectBytesInFlight{1});
      printf("14\n");
      test.execute(AckReceived{WrappingInt32{isn + 1}});
      printf("15\n");
      test.execute(ExpectState{TCPSenderStateSummary::SYN_ACKED});
      printf("16\n");
      test.execute(ExpectNoSegment{});
      printf("17\n");
      test.execute(ExpectBytesInFlight{0});
    }

    {
      TCPConfig cfg;
      WrappingInt32 isn(rd());
      cfg.fixed_isn = isn;
      printf("3\n");
      TCPSenderTestHarness test{"SYN -> wrong ack test", cfg};
      test.execute(ExpectState{TCPSenderStateSummary::SYN_SENT});
      test.execute(ExpectSegment{}
                       .with_no_flags()
                       .with_syn(true)
                       .with_payload_size(0)
                       .with_seqno(isn));
      test.execute(ExpectBytesInFlight{1});
      test.execute(AckReceived{WrappingInt32{isn}});
      test.execute(ExpectState{TCPSenderStateSummary::SYN_SENT});
      test.execute(ExpectNoSegment{});
      test.execute(ExpectBytesInFlight{1});
    }

    {
      TCPConfig cfg;
      WrappingInt32 isn(rd());
      cfg.fixed_isn = isn;
      printf("4\n");
      TCPSenderTestHarness test{"SYN acked, data", cfg};
      test.execute(ExpectState{TCPSenderStateSummary::SYN_SENT});
      test.execute(ExpectSegment{}
                       .with_no_flags()
                       .with_syn(true)
                       .with_payload_size(0)
                       .with_seqno(isn));
      test.execute(ExpectBytesInFlight{1});
      test.execute(AckReceived{WrappingInt32{isn + 1}});
      test.execute(ExpectState{TCPSenderStateSummary::SYN_ACKED});
      test.execute(ExpectNoSegment{});
      test.execute(ExpectBytesInFlight{0});
      test.execute(WriteBytes{"abcdefgh"});
      test.execute(Tick{1});
      test.execute(ExpectState{TCPSenderStateSummary::SYN_ACKED});
      test.execute(ExpectSegment{}.with_seqno(isn + 1).with_data("abcdefgh"));
      test.execute(ExpectBytesInFlight{8});
      test.execute(AckReceived{WrappingInt32{isn + 9}});
      test.execute(ExpectState{TCPSenderStateSummary::SYN_ACKED});
      test.execute(ExpectNoSegment{});
      test.execute(ExpectBytesInFlight{0});
      test.execute(ExpectSeqno{WrappingInt32{isn + 9}});
    }

  } catch (const exception &e) {
    cerr << e.what() << endl;
    return 1;
  }

  return EXIT_SUCCESS;
}
