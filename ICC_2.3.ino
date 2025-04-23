#include <Servo.h>

Servo myServo;

void setup() {
  Serial.begin(9600);
  myServo.attach(9);

}
void loop() {
 Serial.println(".");
 
 if(Serial.available()>0){
  
  String throttle = Serial.readStringUntil('v');
  int angle = throttle.toInt();
  myServo.write(angle);
  delay(10);
 
 }

}
