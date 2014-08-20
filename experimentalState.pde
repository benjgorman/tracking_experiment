void experimentalState()
{
  cp5.hide();
  comparisonPanel.hide();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*boxsize;
      int y = j*boxsize;
      fill(255);
      stroke(0);
      rect(x, y, boxsize, boxsize);
     
      fill(100, 150, 200);
      text(str(j * cols + i + 1), x + boxsize / 2, y + boxsize / 2);
    }
  }

  if (keyPressed) 
  {
    if (key == ';' && trial<23) {
      trial++;
    }
  }
  
  Square tempSquare = trials.get(trial);
   
  rect(tempSquare.xposition, tempSquare.yposition, rect_w, rect_h);
  
  text("Square:" + trial, 400, 25);
  
  text("X:" + mouseX, 20, 25);
  
  text("Y:" + mouseY, 100, 25);
  
  xposition = tempSquare.xposition;
  yposition = tempSquare.yposition;
//test
  
  if ((mouseX > xposition) && (mouseX < xposition + rect_w))
  {
      text("X ON TARGET", 160, 25);
      myPort.write('4');  //when cursor is within target
  }
  else if (mouseX > xposition + rect_w) //When cursor is on right of target
  {
    myPort.write('2');
  }
  else if (mouseX < xposition) //When cursor is on the left of target
  {
    myPort.write('1');
  }
  else
  {
    text("X NO TARGET", 160, 25);
    myPort.write('3');
  }
  if ((mouseY > yposition) && (mouseY < yposition + rect_h))
  {
      text("Y ON TARGET", 160, 65);
      myPort.write('5');  //when cursor is within target
  }
  else if (mouseY > yposition + rect_h) //When cursor is on right of target
  {
    myPort.write('6');
  }
  else if (mouseY < yposition) //When cursor is on the left of target
  {
    myPort.write('7');
  }
  else
  {
    text("Y NO TARGET", 160, 65);
    myPort.write('0');
  }
}

void mouseMoved() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

class Square 
{ 
  int xposition, yposition, id, answer, number;
  Square (int x, int y, int ans, int num) 
  {  
    xposition = x;
    yposition = y;
    answer = ans;
    num = number;
    
  } 
}
