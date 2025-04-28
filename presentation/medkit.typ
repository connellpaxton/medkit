#import "@preview/typslides:1.2.5": *

#title-slide[
  Solution: #stress("M.E.D.K.I.T!")
]

#slide(title: "M.E.D.K.I.T: Introduction")[
#grid(columns: (1fr, 1fr), framed[
  #stress("(I) The Protocol")
  #line(length: 100%)
*Set of rules* to allow devices to connect to each other.

Should be *flexible* enough to incorporate arbitrary medical device
systems of reasonable *configuration*, and accomadate
*diverse feature-sets* through modular
], framed[
  #stress("(II) The Bridge Device")
  #line(length: 100%)
A *physical* device that allows a large subset of devices
that do not implement #stress("The Protocol").

Exploits existing (mechanical or electric) user interface
of the device. Allows for *1st or 3rd parties* to extend a
device without redesigning hardware.
])

#include("protocol.typ")
#include("bridge.typ")
