/*
  for 5 ! sensors
  A0= x position
  A1 = y position
  A2 = red amount
  A3 = green amount
  A4 = blue amount
  A5 = mothing yet, perhaps alpha value
  
  c starts communication, 
  space clears the screen,
  s saves a pdf   
*/

import processing.serial.*;
import processing.pdf.*;

Serial myPort;

float a0 = 1;  //<
float a1 = 1;//<

float previousX = a0;
float previousY = a1;

int redValue;
int greenValue;
int blueValue;

boolean firstContact = true;

void setup()
{
  size(600, 600);
  background(0);
  
  println(Serial.list());
  String portName = Serial.list()[1];  //change this to your port
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil(ENTER);
  
  beginPDF();
}

void draw()
{
    //change stroke color
    strokeWeight(2);
    stroke(redValue, greenValue, blueValue); 
    
    //ellipse(xpos, ypos, 5, 5);
    line(previousX, previousY, a0, a1);
    
    previousX = a0;
    previousY = a1;
    
    
}

void keyPressed()
{
  switch(key) {
    case ' ':
    background(0);
    break;
    
    case 's':
    endPDF();
    break;
    
    case 'c':
    establishContact();
    break;
  }
}

void exit()
{
  myPort.clear();
}