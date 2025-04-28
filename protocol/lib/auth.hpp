#pragma once

namespace medkit {

/**
 * @brief  
 * The Network Packets sent during the authentication
 *    phase of the program
 *
 *  Messages across this portion of the communication
 *  is done through an asynchronous request-response
 *  dichotomy. Control device wrters should take care
 *  to realize that due to safety concerns, a device
 *  may respect the guidance of a command but bound its
 *  realized change. Querying status of inputs is important
 *  to the proper function of nodes.
 */
namespace auth {
}

}
