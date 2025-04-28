#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

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
