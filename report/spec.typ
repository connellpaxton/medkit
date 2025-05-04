= Specifications
== Network
The protocol, and by extension, the bridge device, was designed to be
transport-agnostic. Information can be processed in parallel or in serial,
meaning that anything from a humble UART connection to as high-level as
an HTTP wrapper. In its current state, using the ports on the devkit,
bridge device driver code for a specific described device can be directly
flashed to the PROM of the device, but elements of the protocol allow for
the enabling of remote code uploading in low-security environments.
By default the device is designed to be connect to a local hotspot, allowing
protocol-adherant one-time wireless configuration over TCP, uploading into
non-volatile memory, which could be used to have the device operate in bluetooth
mode, or serial.
