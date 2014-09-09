public void visualSetup()
{
  //initialize the arduino in here
}

public void visualDirection(int direction)
{
  switch(direction)
  {
    case withinTarget_X:
      withinTarget_X_Visual();
      break;
      
    case withinTarget_Y:
      withinTarget_Y_Visual();
      break;
      
    case rightOfTarget:
     rightOfTarget_Visual();
     break;
     
    case leftOfTarget:
      leftOfTarget_Visual();
      break;
      
    case aboveTarget:
      above_Target_Visual();
      break;
      
    case belowTarget:
      below_Target_Visual();
      break;
  }
  
}

public void withinTarget_X_Visual()
{
  myPort.write('4');
}

public void rightOfTarget_Visual()
{
  myPort.write('2');
}

public void leftOfTarget_Visual()
{
  myPort.write('1');
}

public void withinTarget_Y_Visual()
{
  myPort.write('5');
}

public void above_Target_Visual()
{
  myPort.write('6');
}

public void below_Target_Visual()
{
  myPort.write('7');
}
