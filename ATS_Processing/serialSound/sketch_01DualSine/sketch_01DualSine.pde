import processing.serial.*;
import processing.sound.*;

Serial myPort;

float minSensorValue = 0;  //the minimum Sensor value coming in through the serial port
float maxSensorValue = 1023; // the maximun

//define a Sine wave. maybe change to another waveform?
SinOsc wave1;  
SinOsc wave2;

float minFreq= 10;  //the lowest frequency our oscillators will go
float maxFreq = 800; //the highest

//the mapped sensor values that will set the frequencies
float sensorValue1 = 0; //for frequency of oscillator 1
float sensorValue2 = 0; //for frequency of oscillator 2

//the variable we will store the frequency values in
float frequency1 = 0;
float frequency2 = 0;


boolean firstContact = true;

void setup()
{
  size(800, 640);
  background(100);
  
  //create the oscillators.
  wave1 = new SinOsc(this); //starting Sine could change to another waveform
  wave1.play();
  
  wave2 = new SinOsc(this); //starting Sine could change to another waveform
  wave2.play();
  
  //========setup the serial port==================
  //get a list of available ports& print it
  println(Serial.list());
  //set the port we will use from the list. This should be the port the arduino is on
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  //clear the port of any data
  myPort.clear();
  
  //we seperate messages by the new line character ENTER = '\n'
  myPort.bufferUntil(ENTER);

}

void draw()
{
  //If we reciece a new value
    background(100);
  
    //use the mapped sensorValue to set the value of the frequency
    frequency1 = sensorValue1;
    frequency2 = sensorValue2;
  
    //set the frequency of the oscillators
    wave1.freq(frequency1);
   
    wave2.freq(frequency2);
  
  
  
  
  
    //some visual feedback
    //drawing the lines on the screen
    
    //frequency sets the angle of the lines
    float angle1 = map(frequency1, minFreq, maxFreq, 0, PI);
    float angle2 = map(frequency2, minFreq, maxFreq, 0, PI);
 
    strokeWeight(4);
    smooth();
  
    //frequency 1 line
    stroke(0,50,120, 170);
    pushMatrix();
      translate(width/2, height-50);
      noFill();
      ellipse(0, 0, 640, 640);
    
      rotate(angle1); 
      line(0, 0, -320, 0);
      line(-320, 0, -290, 10);
      line(-320, 0, -290, -10);
    popMatrix();
    
    // frequency 2 line
    stroke(120, 0, 50, 200);
    pushMatrix();
      translate(width/2, height-50);
      noFill();
      ellipse(0, 0, 640, 640);
    
      rotate(angle2); 
      line(0, 0, -320, 0);
      line(-320, 0, -290, 10);
      line(-320, 0, -290, -10);
    popMatrix();
  
}

void keyPressed()
{
  switch (key) 
  {
    case 'c':
    establishContact();
    break;
  }
}

//this runs on exit
void exit()
{
  myPort.clear();
  wave1.stop();
  wave2.stop();
}