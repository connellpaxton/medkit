#import "@preview/typslides:1.2.5": *

#show: typslides.with(
  theme: "darky",
)

#title-slide[
  Demo
]

#slide[
*Demo*
#line(length: 100%)
  - Three devices in typical sensor-control-delivery topology
  - Configuration:
    - Sensor (ESP8266 with button), with message type NOTIFY
      - real system analog: heart monitor with alert set for threshold
    - Deliver (ESP8266 with LED), set with SET_PARAMS, read with GET_PARAMS
  #link("https://www.youtube.com/shorts/M94XlU5okJ0")
]
