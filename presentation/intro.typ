#import "@preview/typslides:1.2.5": *

#front-slide(
  title: "M.E.D.K.I.T",
  subtitle: "Medical and Embedded Device Konfiguration and Integration Technology",
  authors: [*Conál* (_angl._ Connell) *Paxton* | *Evangelos Loukedes* | *Jaime Santoro*],
  info: [#link("https://github.com/connellpaxton/medkit/")]
)


#slide(title: "The Team")[
#stress("The Team")
#line(length: 100%)
  *Conál*: Embeddded & Network Software, Systems-level Design, Documentation
  
  *Jaime*: Power Supply Hardware Design, Hardware Procurement

  *Vagos*: Casing Design
]

#title-slide[
  Problem: Healthcare is #stress("Expensive") #footnote[for Americans.]
]

#slide(title: "Problem: Medical Debt")[
*Medical Debt*
#line(length: 100%)
#grid(columns: (2fr, 1fr), gutter: 10pt, [
  - pervasive and catastrophic
  - Negatively influences availability of treatment options to patients.
  - Most Americans have three choices:
    + Be born into enough wealth to never worry about it
    + Have employer-based coverage
    + Take on massive amounts of risky debt to cover treatments
  - What happens when you run out of money (and your car, house, etc)?
],align(center, table(
      columns: 2,
      
      [Amount], [\# of people],
      [Some], [ 20 million ],
      [>\$1,000], [14 million],
      [>\$10,000], [3 million],
  )))

#slide(title: "Problem")[
*Case Study: Insulin Pumps*
#line(length: 100%)
#grid(columns: (1fr, 2fr),
  image("minimed.jpg"))[
- Up-front \~\$6000 cost (plus additional subscriptions, etc)
- Cost manipulation of Insulin
- Only Real Alternative: #stress("Cost Related Nonadherence")
  - paradoxically, more expensive
  - often kills you #footnote[After taking your vision, mobility,
  and your limbs once they get amputed.]
]]
#title-slide[
  #align(center, "Solution: Open Source BioTech?")
]

#slide(title: "Solution: Open Source BioTech")[
*Advantages*
  - Much cheaper
  - Shares information, paves the way for future work
  - Decentralized development allows diverse forks and features
*Disadvantages*
  - Harder to get standardization without the backing of Capital
  - Capital is disincentivized to engage or support projects due
    it helping people that may not directly give you money.
]

#slide(title: "Open Source Biotech: Case Study")[
*Ultra-Low-Cost Insulin Pump*
#line(length: 100%)
#grid(columns: (2fr, 1fr), gutter: 3pt, [
*Pros*
  - \$87 is a lot lower than \$6000
  - High-Quality
    - Compettitive (and sometimes superier) bench-side delivery accuracy.
*Cons*
  - It doesn't work with my \$700 Glucose Monitor!
], align(center, image("pump.jpg"))
)
]

#title-slide[
  Integration
]

#slide(title: "Integration")[
*Why?*
  - Control Systems!
    - having diabetes is a full-time (reverse-finnanced) job!
*How?*
- Communication between medical devices according to a shared communication policy.
*But...*
- Existing or non-compliant devices are inacessible
- Future designs would like to have things to connect to
    - MAJOR barrier to adoption 
]
