
int serialInput; //value that was sent to arduino
bool started = false; // a check to to see if the other program is
                      // ready to start recieving a serial stream

int a0 = 0;
int a1 = 1;
int a2 = 2;
int a3 = 3;
int a4 = 4;
int a5 = 5;

void setup()
{
  Serial.begin(9600);
  
}

void loop()
{
  if(Serial.available())  //check to see if there is serial data in the buffer
  {
    serialInput = Serial.read();  //read a value from the serial buffer
    if (serialInput == 49) {      //If it equals 49 (ASCII 1)
      started = true;             //then set started to TRUE and
    }                             //start sending data
  }

  if (started)
  {
    
    Serial.print(analogRead(a0)); // print the value of A0
    Serial.print(','); //print a comma
    Serial.print(analogRead(a1)); //print the value of A1
    Serial.print(','); //print another comma
    Serial.print(analogRead(a2));
    Serial.print(','); //print another comma
    Serial.print(analogRead(a3));
    Serial.print(','); //print another comma
    Serial.print(analogRead(a4));
    Serial.print(','); //print another comma
    Serial.print(analogRead(a5));
    Serial.println(); //print a line-feed
     
    //delay(100);
    delay(20);
  }
  
}

