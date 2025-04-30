#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

#title-slide[
  Hardware
]

#slide(title: "Hardware: Power Supply")[
#grid(columns:(1fr, 1fr), [
  - 3.7V, 1A Lithim Ion Battery
    - previous design: 2 AAA batteries
  - MT3608 Power Module (Boost Converter)
], align(center, grid(gutter: 10pt, rows: (1fr, 1fr),
  image("MT3608.png"), image("battery.png")
)))
]

#focus-slide[
  #image("schematic.png")
]
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
