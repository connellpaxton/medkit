= Problem Statement
== Medical Debt
Analysis of medical debt levels[1] and household survey data[2] reveals that
medical debt is both pervasive and troubling for many Americans.
Contributing to, and exacerbating this issue, is the high cost of long-term
care for chronic conditions, as individuals suffering from these diseases,
such as the more than 38 million Americans who have diabetes[3], pay recurring
costs for medication, and high initial cost for expensive devices.
Due to the pressures and risk of undertaking large amounts of debt to treat
often interminable illness, many forgo treatment[4, 5]. This introduces
a vicous cycle, as the longer one puts off medical treatment, the worse
their other symptoms may become, leading to an increase in medical
cost and a further degredation with regards to quality of life.

#align(center, table(
      columns: 2,
      
      [Amount], [\# of people],
      [Some], [ 20 million ],
      [>\$1,000], [14 million],
      [>\$10,000], [3 million],
))
Caption: Level of medical debt (USD) experienced by Americans. [1]

== Open Source BioTech
Several grassroots and non-profit organizations, led by researchers, have
pushed to build an open-source environment in biotech, to facilliate greater
collaboration and information-sharing[6]. These movements draw on prior work
by the Free Software Foundation and other FOSS (Free, Open-Source Software)
#footnote[It is worth clarifying that the word "Free" is meant as in
"freedom to modify and redistribute the source under agreed terms", not
necessarily price. In the words of the FSF's Founder, "think free as in free
speech, not free beer."] organizations[7].


Some open source designs, such as the low-cost insulin pump developed in
[8], are producable in small batches at a cost less than a sixtieth of
the cost of consumer models. That same pump has been tested under
international standard and found to be as or more accurate than the
majority of commericially available models[9].

== Practical Implications
While a 60-fold decrease in procurement cost for an insulin pump may
not be completely realisitic when factoring in the specific conditions
for the assembly of medical-grade devices, it is clear that making
information and innovation accessible to other researchers can cut
the development cost for medical devices, and removes copyright
or intellectual proprty barriers standing in the way of entities
that are not profit-motivated from investing in production
#footnote[There are several examples of previous philanthropic action
towards medical debt relief, almost exclusively through grass-roots and
religious crowdsourcing to buy medical debt at discounted rates. There
still exists no path for non-profits to try and stem the problem at the
source, as manufacture of the goods is dependent on expensive R&D and
certification. If open-source devices manage certification, funds that
would go towards cancelling debt could be used to circumvent a subset
of the high prices causing the debt.].

== Integration
Many of these devices, despite their price point, would have a hard
time peneratrating the market due to issues with integration. Often
medical devices are parts of larger networks that use sensor information
and various control interfaces, apps, and other closed-loop mechanisms.
The way that these systems communicate is often highly propriatary,
limiting the reach of open-source products, as they must come complete
with an existing ecosystem, which necessarily must be forged from scratch
due to the opaque communication structure. Our market research (Section 2)
revealed that not having to change devices was also a large barrier for
consumers, and that there is a strong desire for cheaper hardware that
"just works" with their current sensors, allow them to use their phone
as a control device, etc.

While some devices are designed to have bluetooth uplinks or other
future network capabilities, they do not have an already established
way of communicating with sensor systems.

= MEDKIT
*M.E.D.K.I.T* seeks to help solve this problem by providing a uniform,
general-purpose framework for communication over medical device networks,
*The Protocol*, and providing adaptive hardware and software to enable
existing devices to interact with the protocol in a packaged known as
*The Bridge Device*.

This document outlines the overall structure of the two components
and the design choices that shaped the details of their implementation.



= Citations

[1] #link("https://www.healthsystemtracker.org/brief/the-burden-of-medical-debt-in-the-united-states/#Share%20of%20adults%20who%20have%20medical%20debt,%20by%20health%20status%20and%20disability%20status,%202021")

[2] #link("https://www.cdc.gov/nchs/data/nhsr/nhsr180.pdf")

[3] #link("https://www.cdc.gov/diabetes/php/data-research/index.html#cdc_report_pub_study_section_2-prevalence-of-both-diagnosed-and-undiagnosed-diabetes")

[4] #link("https://diabetesjournals.org/care/article/45/3/594/139257/Cost-Related-Medication-Nonadherence-in-Adults")

[5] #link("https://www.sciencedirect.com/science/article/pii/S0168822718305345?via%3Dihub")

[6] #link("https://cambia.org/bios-landing/")

[7] #link("https://fsf.org")

[8] #link("https://tyromancy.art/ece2799/pump.pdf")

[9] #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC11089868/")
