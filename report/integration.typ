= Modules
The design work for the system was split into three primary modules
with a high level of encapsulation between them, allowing work to be
efficently done on different modules without design choices in one
module affecting those done in others.

#align(center, image("integration.png"))

These three modules were as follows:
+ *Software*: Responsible for allowing the devices to perform its
  chief function of communicating with other devices.
  + *Protocol*: The set of rules governing communication between this
    device and others.
  + *Bridge Device Driver*: The software which interfaces the hardware
    and the signals to be processed with the network, using the protocol.
    The specifics of the driver is specific to the operation of the device
    being adapted, and can be modified and uploaded to the *Microcontroller*
    either through an EEPROM, or through using the *Protocol* for hot-reloading
    of configurations.
+ *Hardware*: Responsible for providing the necessary physical tools
  for communication, as well as providing a stable resiliant environment
  for use by regulating power.
  + *Power Supply*: provides for the constant function of the device.
  + *Microcontroller*: provides for the execution of the device driver software.
+ *Casing*: Responsible for protecting the function of the device
  from the elements and regular use, as well as determining a form
  factor that reponds well to customer concerns around quality of life.


