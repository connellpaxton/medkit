#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

#title-slide[
  (I) The Protocol
]

#slide(title:"Protocol: Overview",
grid(columns:(1fr, 1fr),[
- 3 "Roles"
- 3 Stages
  1. Authentication
  2. Configuration
  3. Steady State
],
align(center, image(height: 100%, "protodiag.png"))
))

#slide(title: "The Protocol: Implementation")[
*Implementation*
#line(length: 100%)
- Reference Implementation: C++
  - No STL or stdlib dependencies - key for embedded
  - NetworkInterfaceTrait
- Lots of abstraction, but low memory footprint
- Configuration Table Layout: access-time-optimized
- High-Frequency Packet Layout: size-optimized
]

#slide(title: "The Protocol: Implementation: Request", align(center)[
#figure(
  image("res.png"),
  caption: [C++ Struct Diagram for the Request Packet],
)
])
