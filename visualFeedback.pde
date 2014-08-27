

public void visualDirection(int direction)
{
  switch(direction)
  {
    case withinTarget_X:
      withinTarget_X_Visual();
      break;
    case withinTarget_Y:
    
      break;
    case rightOfTarget:
      
     break;
     
    case leftOfTarget:
      break;
      
    case aboveTarget:
      break;
      
    case belowTarget:
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

public void within_Target_Y_Visual()
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
