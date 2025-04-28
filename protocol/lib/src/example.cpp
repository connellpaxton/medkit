#include <medkit/net/Network.hpp>
#include <medkit/steady.hpp>

#include <sys/socket.h>

struct SocketConnectionInfo {
  const struct sockaddr* addr;
  socklen_t addrlen;
};

typedef int SocketHandle;

using medkit::Result;
/**
 * uses the Unix TCP socket to implement a medkit-compliant
 * network object
 */
template<>
struct medkit::NetworkInterfaceTrait<SocketHandle, SocketConnectionInfo> {
  NetworkInterfaceTrait(const int& fd_) : fd (fd_) {}
  Result connect(const SocketConnectionInfo& conn_info) {
    return Result::Success;
  }
  Result send(const uint8_t data, uint32_t len) {
    return Result::Success;
  }
  Result read(uint8_t* memory, uint32_t n, uint32_t* len) {
    return Result::Success;
  }
private:
  int fd;
};

int main() {
  /* TODO: show authorization stage */

  uint32_t selected_param = 1;

  using namespace medkit::steady;
    
  medkit::steady::Request set_req;
  {
    using medkit::steady::Request;
    set_req.type = Request::MessageType::SetParam;
    set_req.content = Request::Content {
      .set_param = {
        .param_handle = selected_param,
      },
    };
  }
}
