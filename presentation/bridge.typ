#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

#title-slide[
	(II) The Bridge
]

#slide(title: "The Bridge: The Problem")[
*Intuition: The Problem*
#line(length: 100%)
- Systems are just arrows and boxes!
- The protocol governs boxes with some types of arrows
- Not every system has the arrows you want
- You can't really just add arrows to a box
	- faaaaaaar too system-specific for a single protocol to manage
	- requires extremely in-depth information about internal arrows
]

#slide(title: "The Bridge: The Solution")[
*Intuition: The Solution*
#line(length: 100%)
- Put a box around the problem
- Draw your own arrows
- Use whatever you know about the system to draw internal arrows
	- When you know nothing, think like a user

#line(length: 100%)
*Bottom Line:* We can own the arrows _*and*_ the boxes.

]


#slide(title: "The Bridge: Implementation (Suspenseful!)")[
*Implementation*
#line(length: 100%)
- Everything has a button...
]

#slide(title: "The Bridge: Implementation (Suspenseful!)")[
*Implementation*
#line(length: 100%)
- Everything has a button
- Every button has a wire...
]

#slide(title: "The Bridge: Implementation (Suspenseful!)")[
*Implementation*
#line(length: 100%)
- Everything has a button
- Every button has a wire
- Wires don't really know that they're connected to buttons...
]


#slide(title: "The Bridge: Implementation (Suspenseful!)")[
*Implementation*
#line(length: 100%)
- Everything has a button
- Every button has a wire
- Wires don't really know that they're connected to buttons
- (Delivery) We can splice in wires into input streams and fake our own inputs
- (Sensor) We can splice in wires into output streams and translate dispatch
  information.
- Due to the flexible nature of the protocol, we don't have to do much
to reach compliance.
]

#include("bridge-hardware.typ")
#include("bridge-housing.typ")

