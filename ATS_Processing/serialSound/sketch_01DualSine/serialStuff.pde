//Serial event looking for message (0,0)
void serialEvent (Serial myPort)
{
  while (myPort.available() > 0)
  {
    String inString = myPort.readStringUntil(ENTER);
    
    if (inString != null)
    {
      inString = trim(inString);
      
      println(inString);
      
      if (firstContact == false)
      {
        float[] sensorValues = float(split(inString, ','));
        println("Sensor 1= " + sensorValues[0]);
        println("Sensor 2= " + sensorValues[1]);
      
        sensorValue1 = map(sensorValues[0], minSensorValue, maxSensorValue, minFreq, maxFreq);
        sensorValue2 = map(sensorValues[1], minSensorValue, maxSensorValue, minFreq, maxFreq);
      } else {
        myPort.clear();
        firstContact = false;
      }
    }
    
  }
}

void establishContact()
{
  myPort.write('1');
  println("data sent");
}