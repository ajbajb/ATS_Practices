//graph for multiple sensor readings
//Be careful not to let the scroll slow to idle. Will max out your memory!
// 

import processing.serial.*;

Serial myPort;
float inByte = 0;

int scrollSpeed = 3;

ArrayList<DataPoint> datapoint;

boolean firstContact = true;


void setup()
{
  size(900, 600);
  datapoint = new ArrayList<DataPoint>();
  
  println(Serial.list());
  String portName= Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  myPort.clear();
}

void draw()
{
  background(0);

  for (int i = 0; i < datapoint.size(); i++)
  {
    DataPoint point = datapoint.get(i);
    point.update();
    point.display();
  }
  
  for (int i = datapoint.size() -1; i >=0; i--)
  {
    DataPoint point = datapoint.get(i);
    if (point.isFinished())
    {
      datapoint.remove(i);
      println(datapoint.size());
    }
  }
  
  
}

void keyPressed()
{
  switch(key)
  {
    case '.':
    scrollSpeed++;
    break;
    
    case ',':
    scrollSpeed--;
    break;
    
    case ' ':
    datapoint.clear();
    break;
    
    case 'c':
    establishContact();
    break;
  }
}

void exit()
{
  myPort.clear();
  myPort.stop();
}