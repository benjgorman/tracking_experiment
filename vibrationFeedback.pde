public void vibrationSetup()
{
  //initialize the arduino in here
}

public void tactileDirection(int direction)
{
  switch(direction)
  {
    case withinTarget_X:
      withinTarget_X_Vibration();
      break;
      
    case withinTarget_Y:
      withinTarget_Y_Vibration();
      break;
      
    case rightOfTarget:
     rightOfTarget_Vibration();
     break;
     
    case leftOfTarget:
      leftOfTarget_Vibration();
      break;
      
    case aboveTarget:
      above_Target_Vibration();
      break;
      
    case belowTarget:
      below_Target_Vibration();
      break;
  }
  
}

public void withinTarget_X_Vibration()
{
  myPort.write('3');
}

public void rightOfTarget_Vibration()
{
  myPort.write('2');
}

public void leftOfTarget_Vibration()
{
  myPort.write('1');
}

public void withinTarget_Y_Vibration()
{
  myPort.write('0');
}

public void above_Target_Vibration()
{
  myPort.write('7');
}

public void below_Target_Vibration()
{
  myPort.write('6');
}
