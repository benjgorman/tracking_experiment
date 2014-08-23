
void setupState()
{
  cp5.hide();
  comparisonPanel.hide();
  setupPanel.show();
 
  background(0);
  fill(255);
  f = createFont("Helvetica", 48);

  textFont(f, 40);
  textAlign(CENTER);
  text("Design Framework for Peripheral Feedback", displayWidth/2 ,80);
  
 //text(setupPanel.get(Textfield.class,"experimentNumber").getText(), 360,130);
}

public void Continue() 
{
  //setupPanel.get(Textfield.class,"participantNumber").clear();
  currentScreen = 1;
}
