#import "@preview/typslides:1.2.5": *

#set table(
  stroke: none,
  gutter: 0.1em,
  fill: (x, y) =>
    if x == 0 or y == 0 { black },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}


#show: typslides.with(
  theme: "darky",
)

#include("intro.typ")
#include("medkit.typ")


/*
https://www.healthsystemtracker.org/brief/the-burden-of-medical-debt-in-the-united-states/
*/
