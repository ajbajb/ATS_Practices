void serialEvent (Serial myPort)
{
  if (myPort.available() > 0 ) {
    String inString = myPort.readStringUntil('\n');
  
    if (inString != null)
    {
      //trim of whitespace
      inString = trim(inString);
      println(inString);
      if (firstContact == false)
      {
        //seperate the values on the comma and convert the string to an int
        float[] dataValue = float(split(inString, ','));
        
        //map the values to the screen height
        println(dataValue);
    
        for(int i = 0; i < dataValue.length; i++)
        {    
          dataValue[i] = map(dataValue[i], 0, 1023, 0, height);
          
        }
    
        //and add the dataValues to the datapoints array
        datapoint.add(new DataPoint(width - 100, dataValue[0], scrollSpeed, color(255, 0, 0)));
        datapoint.add(new DataPoint(width - 100, dataValue[1], scrollSpeed, color(0, 255, 0)));
        datapoint.add(new DataPoint(width - 100, dataValue[2], scrollSpeed, color(0, 0, 255)));
        datapoint.add(new DataPoint(width - 100, dataValue[3], scrollSpeed, color(255, 255, 0)));
        datapoint.add(new DataPoint(width - 100, dataValue[4], scrollSpeed, color(0, 255, 255)));
        datapoint.add(new DataPoint(width - 100, dataValue[5], scrollSpeed, color(255, 0, 255)));
    
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