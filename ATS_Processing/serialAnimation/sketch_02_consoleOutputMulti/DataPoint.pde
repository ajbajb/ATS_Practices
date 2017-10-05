class DataPoint
{
  float x, y;
  float speed;
  color c;
  
  DataPoint(float xpos, float ypos, float sp, color lineColor)
  {
    x = xpos;
    y = ypos;
    speed = sp;
    c = lineColor;
  }
  
  void update()
  {
    x= x - speed;
  }
  
  void display()
  {
    stroke(c);
    fill(c);
    ellipse(x, y, 5, 5);
  }
  
  boolean isFinished()
  {
    if (x < 0 || x > width)
    {
      
      return true;
    } else {
      return false;
    }
  }
  

}