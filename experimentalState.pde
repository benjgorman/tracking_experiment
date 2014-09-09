int currentState = 0;
boolean trialRunning = false;

ControlTimer c;
Textlabel t;
long time;

void experimental()
{
  switch(currentState)
  {
  case 0: startState(); break;
  case 1: experimentalState(); break;
  default: background(0); break;
  }
}

void startState()
{
  background(255);
  cp5.hide();
  comparisonPanel.hide();
  setupPanel.hide();
  experimentPanel.show();
  
  expID.setText("ExperimentID: " + experimentID);
  partID.setText("ParticipantID: " + participantID);
  
  output = createWriter(participantID + "_" + experimentID + ".txt");
 
  //experiment number
  //participant number
  
  //choose counterbalancing
  
  //start button
 
}

void experimentalState()
{
  background(255);
  //fill(0);
  runTrial();
  
  //display button which starts and a timer and then display a button to stop the timer
  //runTrial(); //pass in target square etc
}

void feedback(int direction, int feedback)
{
  switch(feedback)
  {
    case VISUAL:
      visualDirection(direction);
    break;
    case AUDIO:
      audioDirection(direction);
    break;
    case TACTILE:
      tactileDirection(direction);
    break;
  }
}


void runTrial()
{
    background(0);
    cp5.hide();
    comparisonPanel.hide();
    setupPanel.hide();
    experimentPanel.hide();

  if (trialRunning == true && trial <=23)
  {
    background(255);
    trialPanel.hide();
    
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
    
    Square tempSquare = trials.get(trial);
     
    rect(tempSquare.xposition, tempSquare.yposition, rect_w, rect_h);
    
    text("Square: " + trial, 25, 45);
    
    text("X:" + mouseX, 20, 25);
    
    text("Y:" + mouseY, 100, 25);
   
    xposition = tempSquare.xposition;
    yposition = tempSquare.yposition;
    
    
    if ((mouseX > xposition) && (mouseX < xposition + rect_w))
    {
        text("X ON TARGET", 160, 25);
        
        feedback(withinTarget_X, currentFeedbackType);
        
        //myPort.write('4');  //when cursor is within target
    }
    else if (mouseX > xposition + rect_w) //When cursor is on right of target
    {
      feedback(rightOfTarget, currentFeedbackType);
      //myPort.write('2');
    }
    else if (mouseX < xposition) //When cursor is on the left of target
    {
      feedback(leftOfTarget, currentFeedbackType);
      //myPort.write('1');
    }
    else
    {
      text("X NO TARGET", 160, 25);
      myPort.write('3');
    }
    if ((mouseY > yposition) && (mouseY < yposition + rect_h))
    {
        text("Y ON TARGET", 160, 65);
        feedback(withinTarget_Y,currentFeedbackType);
        //myPort.write('5');  //when cursor is within target
    }
    else if (mouseY > yposition + rect_h) //When cursor is above of target
    {
      feedback(aboveTarget, currentFeedbackType);
      //myPort.write('6');
    }
    else if (mouseY < yposition) //When cursor is on the bottom of target
    {
      feedback(belowTarget, currentFeedbackType);
      //myPort.write('7');
    }
    else
    {
      text("Y NO TARGET", 160, 65);
      myPort.write('0');
    }
  }
  else
  {
    if (trial == -1)
    {
      textSize(20);
      text("Press space bar to begin the trial, make sure they have calibrated the headtracker and all wires and etc are in", displayWidth/2, 20);
    }
    else if (trial == 24)
    {
      currentScreen = 2;
    }
    else
    {
      trialPanel.show();
      
      textSize(10);
    }
  }
  
  textSize(10);
  //fill(0);
  
  if (c!=null)
  {
    time = c.time();
  }

  text(String.valueOf(time), 50, 60);
    
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
  int xposition,yposition;
  int target_number;
  int response;
  long responseTime;
  
  Square (int x, int y, int num) 
  {  
    xposition = x;
    yposition = y;
    target_number = num;
  } 
}

public void Submit()
{
  if (trialAnswer.getText().equals(trialAnswer2.getText()) && trialAnswer.getText().equals("") == false && trialAnswer2.getText().equals("") == false)
  {
  
      System.out.println("Target is " + trials.get(trial).target_number);
      
      trials.get(trial).response = Integer.parseInt(trialAnswer.getText());
      trials.get(trial).responseTime = time;
      
      System.out.println("Target response was " + trials.get(trial).response);
      System.out.println("Target response time was " + trials.get(trial).responseTime);
      
  
    trialAnswer.clear();
    trialAnswer2.clear();
    
    //trials.set(trial, temporary);
    
    //println("Response:" + trials.get(trial).response);
    
  //clear the previous textboxes
  trialAnswer.setFocus(false);
  trialAnswer2.setFocus(false);
  
  //setup the new timer
  c = new ControlTimer();
  c.setSpeedOfTime(1);
    
  //set the new trial to run
  trial++;
  trialRunning = true;
  
  trialWarning.setVisible(false);
  }
  else
  {
    trialWarning.setVisible(true);
  }
}

boolean played = false;

void keyPressed() 
{ 
  if (currentState == 1 && trialRunning == false && key== ' ' && trial == -1)
  {
    c = new ControlTimer();
    c.setSpeedOfTime(1);
    
    trialRunning = true;
    trial++;
    println("Trial running true");
 
  }
  else if(currentState == 1 & trialRunning == true && key==' ')
  {
    c = null;
    trialRunning = false;
    
    //show the entry box
    //show the validation box
  }
}

public void Start() 
{
  currentState = 1;
}
