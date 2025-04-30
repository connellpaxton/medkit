#include <ESP8266WiFi.h>
#include "steady.hpp"

using medkit::steady::Response;
using medkit::steady::Request;

#include <stdlib.h>

#include <math.h>

#include <ESP8266WiFi.h>
#define BAUD_RATE 115200

#define WIFI_SSID "insulin"
#define WIFI_PASS "insulin1"

/* 1337 is the delivery device, 1338 is the sensor */
WiFiServer srv(1337);

#define INPUT_BUFSIZE 256
char input_buffer[INPUT_BUFSIZE];

String IP;

void wifi_connect() {
  WiFi.begin(WIFI_SSID, WIFI_PASS);
  
  Serial.print("Connecting");

  while(WiFi.status() != WL_CONNECTED) {
    delay(300);
    Serial.print(".");
    ;
  }

  IP = WiFi.localIP().toString();
}

#define BUTTON D7

void setup() {
  pinMode(BUTTON, INPUT_PULLUP);
  Serial.begin(BAUD_RATE);
  Serial.println("TEST");

  wifi_connect();

  /* start server */
  srv.begin(1337);
  Serial.println(IP);
}

bool toggle = false;

int n_params = 1;
int params[1];
int& pump_level = params[0];

Request handle_button(bool on) {
  return Request {
    .type = Request::MessageType::Notify,
    .content = {
      .raw = on,
    },
  };
}

void loop() {
  auto client = srv.accept();

  if(client) {
    Serial.println(IP);
    Serial.println("Client Accepted");

    while(client.connected()) {
      /* block until button is pressed */
      while(digitalRead(BUTTON))
        delay(10);
      
      auto res = handle_button(1);
      Serial.write(reinterpret_cast<const char*>(&res), sizeof(res));
      client.write(reinterpret_cast<const char*>(&res), sizeof(res));
      delay(500);
    }

    client.stop();
    Serial.println("Client Disconnected");
  }
}
