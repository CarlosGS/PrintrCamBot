// DTMF controller by Carlosgs (http://carlosgs.es)
// License: CC-BY-SA (http://creativecommons.org/licenses/by-sa/3.0/)

#include <Servo.h>

#define LED_PIN 13

#define D1_PIN 8
#define D2_PIN 9
#define D4_PIN 10
#define D8_PIN 11
#define DataValid_PIN 12

#define TRAVEL_SERVO_PIN 3
#define PAN_SERVO_PIN 2
#define TILT_SERVO_PIN 4

Servo travelServo;
Servo panServo;
Servo tiltServo;

//travelPos = 90;
int panPos = 90;
int tiltPos = 90;

int travelSpeed = 30; // 0-90 | MIN-MAX

int inter_reading_delay = 25; // [ms]

void setup() {
  delay(1000);
  pinMode(LED_PIN, OUTPUT);
  travelServo.attach(TRAVEL_SERVO_PIN);
  panServo.attach(PAN_SERVO_PIN);
  tiltServo.attach(TILT_SERVO_PIN);
  //Serial.begin(9600);
}

int read_DTMF_val() {
  int ret = digitalRead(D1_PIN)+2*digitalRead(D2_PIN)+4*digitalRead(D4_PIN)+8*digitalRead(D8_PIN);
  return ret;
}

void loop() {
  //travelServo.write(travelPos);
  panServo.write(panPos);
  tiltServo.write(tiltPos);
  
  if(digitalRead(DataValid_PIN)) { // When a tone is detected
    digitalWrite(LED_PIN, HIGH); // Turn on LED
    int command = read_DTMF_val();
    //Serial.println(command);
    switch(command) {
      
      case 1: // Travel left while pressing
        travelServo.write(90+travelSpeed);
        delay(inter_reading_delay);
        while(digitalRead(DataValid_PIN))
          delay(inter_reading_delay);
        travelServo.write(90);
        break;
      case 3: // Travel right while pressing
        travelServo.write(90-travelSpeed);
        delay(inter_reading_delay);
        while(digitalRead(DataValid_PIN))
          delay(inter_reading_delay);
        travelServo.write(90);
        break;
        
      case 2: // Tilt up
        tiltPos++;
        if(tiltPos > 180) tiltPos = 180;
        break;
      case 8: // Tilt down
        tiltPos--;
        if(tiltPos < 0) tiltPos = 0;
        break;
        
      case 4: // Pan left
        panPos++;
        if(panPos > 180) panPos = 180;
        break;
      case 6: // Pan right
        panPos--;
        if(panPos < 0) panPos = 0;
        break;
        
      case 7: // Travel left slow
        travelServo.write(90+travelSpeed/3);
        break;
      case 9: // Travel right slow
        travelServo.write(90-travelSpeed/3);
        break;
        
      case 5: // Stop travel
        travelServo.write(90);// Stop the traveling motion
        break;
    }
  } else { // If no tone is detected, we stop
    digitalWrite(LED_PIN, LOW);
    //travelServo.write(90);// Stop the traveling motion
  }
  delay(inter_reading_delay);
 }
