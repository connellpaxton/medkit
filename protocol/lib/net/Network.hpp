#pragma once

#include "../MedKit.hpp"

#include <cstdint>
namespace medkit {

template<typename Handle, typename ConnectionInfo>
struct NetworkInterfaceTrait {
  medkit::Result connect(const ConnectionInfo& conn_info);
  medkit::Result send(const uint8_t* data, uint32_t len);
  medkit::Result read(uint8_t* memory, uint32_t n, uint32_t* len);
  private:
    Handle& self;
};

}
