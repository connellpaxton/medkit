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

#include <Adafruit_GFX.h> // Core graphics library
#include <Adafruit_ST7789.h> // Hardware-specific library for ST7789
#include <SPI.h> // SPI library

#include <ESP8266WiFi.h>

// Define the pins used for the display
#define TFT_CS 0 // Chip select pin (D3)
#define TFT_RST 4 // Reset pin (D2)
#define TFT_DC 5 // Data/Command pin (D1)

Adafruit_ST7789 tft = Adafruit_ST7789(TFT_CS, TFT_DC, TFT_RST);

WiFiServer srv(1337);

#define INPUT_BUFSIZE 256
char input_buffer[INPUT_BUFSIZE];

String IP;

void wifi_connect() {
  WiFi.begin(WIFI_SSID, WIFI_PASS);
  
  tft.print("Connecting");

  while(WiFi.status() != WL_CONNECTED) {
    delay(300);
    tft.print(".");
    ;
  }

  IP = WiFi.localIP().toString();
}

void setup() {
  tft.init(240, 320);
  tft.setRotation(3);
  tft.fillScreen(ST77XX_BLACK);

  tft.setTextColor(ST77XX_WHITE);
  tft.setTextSize(1);
  tft.setCursor(0, 0);
  

  wifi_connect();

  /* start server */
  srv.begin(1337);
  tft.println(IP);
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

Response handle_request(const Request& req) {
  Response res {
    .status = Response::Status::Ok,
  };

  auto handle = req.content.set_param.handle;

  switch(req.type) {
      case Request::MessageType::Notify:
        toggle = !toggle;
        pump_level = 255 * toggle;
        tft.print("\nNotify event received, toggling state of pump to ");
        tft.println(pump_level);
      break;
      case Request::MessageType::SetParam:
      if(handle < n_params) {
        params[handle] = req.content.set_param.value;
        tft.print("Changing pump level to: ");
        tft.println(pump_level);
      } else {
        res.status = Response::Status::NotFound;
        tft.println("Not found!");
      }
      break;
      default:
        res.status = Response::Status::Unavailable; 
        tft.println("Unrecognized message type");
      break;
  }

  return res;
}

void loop() {
  auto client = srv.accept();

  if(client) {
    tft.println("Client Accepted");

    while(client.connected()) {
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
