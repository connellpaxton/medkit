#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

#title-slide[
  The Bridge: Casing
]
#slide(title: "The Bridge: Casing", grid(columns:(1fr, 2fr), [
- PLA Plastic
- Seperate Dividers
- Open-Top Design
  - Easy Replacement
- Dense Filiment
],align(center, grid(rows: (1fr, 1fr), image("case.png"), image("top.png"))
)))
/*
#slide(title: "YOUR TITLE HERE")[
TEXT ABOVE A LINE CAN BE DONE LINE THIS
#line(length: 100%)

*bold text*
- Un-numbered lists
  - with children
+ Numbered lists
  + with children
]

#slide(title: "YOUR TITLE HERE FOR THIS SLIDE")[
  This is how images can be inserted:
  #image("pump.jpg", width: 50%)
]
*/
