#include "../../protocol/lib/steady.hpp"
#include <iostream>
#include <cstring>

template<typename T>
void print_raw(const T& t) {
  std::cout.write(reinterpret_cast<const char*>(&t), sizeof(T));
}

void usage() {
  std::cerr << "Your command line args suck!" << std::endl;
}

using namespace medkit::steady;
int main(int argc, char* argv[]) {
  Request req;

  if(argc == 4) {
    if(strcmp(argv[1], "set")) {
      usage();
      return 1;
    }
    int handle = atoi(argv[2]);
    int value = atoi(argv[3]);
    print_raw(Request {
      .type = Request::MessageType::SetParam,
      .content = {
        .set_param = {
          .handle = static_cast<uint32_t>(handle),
          .value = static_cast<uint32_t>(value),
        }
      }
    });
  } else if(argc == 3) {
    int handle = atoi(argv[2]);
    if(strcmp(argv[1], "get")) {
      usage();
      return 1;
    }
    print_raw(Request {
      .type = Request::MessageType::ReadParam,
      .content = {
        .read_param = {
          .handle = static_cast<uint32_t>(handle),
        }
      }
    });
    
  } else if(argc == 2) {
    if(!strcmp(argv[1], "notify")) {
      usage();
      return 1;
    }
    print_raw(Request {
      .type = Request::MessageType::Notify,
    });
    
  } else {
    usage();
    return 1;
  }
}
