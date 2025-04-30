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

#define PUMP D0

void setup() {
  pinMode(PUMP, OUTPUT);
  Serial.begin(BAUD_RATE);
  Serial.println("TEST");
  delay(1000);
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

Response handle_request(const Request& req) {
  Response res {
    .status = Response::Status::Ok,
  };

  auto handle = req.content.set_param.handle;

  switch(req.type) {
      case Request::MessageType::Notify:
        toggle = !toggle;
        pump_level = 255 * toggle;
        analogWrite(PUMP, pump_level);
      break;
      case Request::MessageType::SetParam:
      if(handle <= n_params) {
        params[handle] = req.content.set_param.value;
        Serial.print("Changing pump level to: ");
        Serial.println(pump_level);
        analogWrite(PUMP, pump_level);
      } else {
        res.status = Response::Status::NotFound;
      }
      break;
      default:
        res.status = Response::Status::Unavailable; 
        Serial.println("Unrecognized message type");
      break;
  }

  return res;
}

void loop() {
  auto client = srv.accept();

  if(client) {
    Serial.println(IP);
    Serial.println("Client Accepted");

    while(client.connected()) {
      /* read initial message from connecting device */
      std::vector<uint8_t> data(sizeof(Request));
      while(client.available() > 0) {
        int len = client.read(input_buffer, INPUT_BUFSIZE);
        if(len < data.size()) {
          Serial.print("Insufficent data in package: ");
          break;
        }
        Serial.write(input_buffer, len);
        std::memcpy(data.data(), input_buffer, len);
        auto res = handle_request(*reinterpret_cast<Request*>(data.data()));
        Serial.write((const char*)&res, sizeof(res));
        client.write((const char*)&res, sizeof(res));
      }
    }

    client.stop();
    Serial.println("Client Disconnected");
  }
}
