char val; // Data recieved from the serial port

void setup()
{
 pinMode(3, OUTPUT); 
 pinMode(5, OUTPUT);
 
 pinMode(9, OUTPUT); 
 pinMode(10, OUTPUT);
 
 digitalWrite(3, LOW);
 digitalWrite(5, LOW);
 
 digitalWrite(9, LOW);
 digitalWrite(10, LOW);
 
 Serial.begin(9600); //baud rate 9600 bits/s
}


void loop()
{
  if(Serial.available() > 0)
  {
    val = Serial.read();
  }
    if(val == '1') //left of target - move right
    {
      digitalWrite(5, HIGH);
      digitalWrite(9, LOW);
    }
    else if(val == '2') //right of target - move left
    {
      digitalWrite(9, HIGH);
      digitalWrite(5, LOW);
    }
    else if(val == '3')
    {
      digitalWrite(9, LOW);
      digitalWrite(5, LOW);
    }
    else if(val == '4')
    {
      digitalWrite(5, HIGH);
      digitalWrite(9, HIGH);
    }
    else if(val == '5')
    {
      digitalWrite(3, HIGH);
      digitalWrite(10, HIGH);
    }
    else if(val == '6')
    {
      digitalWrite(10, HIGH);
      digitalWrite(3, LOW);
    }
    else if(val == '7')
    {
      analogWrite(3, 255);
      //digitalWrite(3, HIGH);
      digitalWrite(10, LOW);
    }
    else if(val == '0')
    {
      digitalWrite(3, LOW);
      digitalWrite(10, LOW);
    }
   
}
