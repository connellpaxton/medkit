#pragma once

#include <cstdint>

namespace medkit {

/* theoretical maximum number of devices. If you've got this many,
 * make sure your bandwith is high enough. */
constexpr uint32_t MAX_DEVICES = (1 << 26);

/*  Messages across this portion of the communication
 *  is done through an asynchronous request-response
 *  dichotomy. Control device wrters should take care
 *  to realize that due to safety concerns, a device
 *  may respect the guidance of a command but bound its
 *  realized change. Querying status of inputs is important
 *  to the proper function of nodes.
 */
namespace steady  {

struct Request {
  const int8_t magic[4] = {'\xEF', 'R', 'E', 'Q'}; /* */

  /* should be unique, but could be reused if you are no
   * longer tracking the job. Devices could seek to offload
   * old jobs to prevent build-up of memory allocation on
   * devices, but as a general practice storing errors
   * with associated ID's until sufficently queried will
   * allow easier debugging
   */
  
  enum MessageType {
    Reauthenticate,
    Reconfigure,
    SetParam,
    ReadParam,
    GetCommandStatus,
    Notify,
    RequestSensorHook,
  } type :8;

  /* 64 bits total */
  union Content {
    uint64_t raw;

    struct Reauthenticate {
      /* notifies other party to wait on the sending of a new
       * authentication key.
       */
      bool receive_new_key :32;
      uint32_t resv;
    } reauthenticate;

    struct Reconfigure {
      /* mandates a reauthentication */
      uint32_t must_reauthenticate;
      uint32_t resv;
    } reconfigure;

    struct SetParam {
      /* handle corresponding to parameter name, lookup table during configuration should be used to obtain handles */
      uint32_t handle;
      uint32_t value;
    } set_param;
    
    struct ReadParam {
      /* handle corresponding to parameter name */
      uint32_t handle;
      uint32_t resv;
    } read_param;

    struct GetRequestStatus {
      uint32_t request_number;
      uint32_t resv;
    } get_request_status;

    struct RequestSensorHook {
      enum Threshold {
        Above = 0x01,
        Below = 0x02,
        Trigger = Above | Below,
      } : 2;
      uint32_t param_handle  :30;
      uint32_t param_value;
    } requestsensorhook;
  } content;
};

struct Response {
  int8_t magic[4] = {'\xEF', 'R', 'E', 'S'}; 
  enum Status {
    Ok,
    NotPermitted = 0x01,
    NotFound = 0x02,
    Unavailable = 0x04,
  } status : 32;

  union Content {
    uint64_t raw;
    struct JobData {
      enum Status {
        KILLED,
        DONE,
        RUNNING
      } status:32;
      uint32_t exit_code;
    };
    struct Param {
      uint32_t name;
      uint32_t value;
    } param;
  } content;
};

}

 
}
