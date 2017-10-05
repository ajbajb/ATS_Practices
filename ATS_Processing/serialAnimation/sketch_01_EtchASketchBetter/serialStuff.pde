void serialEvent (Serial myPort)
{
  while (myPort.available() > 0)
  {
    String inString = myPort.readStringUntil(ENTER);
    
    if (inString != null)
    {
      inString = trim(inString);
      println(inString);
      if (firstContact== false)
      {
      
        float[] dataValues = float(split(inString, ','));
      
        a0 = map(dataValues[0], 0, 1023, 0, width);
        a1 = map(dataValues[1], 0, 1023, 0, height);
        
        redValue = int(map(dataValues[2], 0, 1023, 0, 255));
        greenValue = int(map(dataValues[3], 0, 1023, 0, 255));
        blueValue = int(map(dataValues[4], 0, 1023, 0, 255));
      
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