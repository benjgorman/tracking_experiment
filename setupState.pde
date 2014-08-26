
void setupState()
{
  cp5.hide();
  comparisonPanel.hide();
  setupPanel.show();
  experimentPanel.hide();
  trialPanel.hide();
 
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
  if (experimentNumber.getText().equals(experimentNumber2.getText()) 
  && participantNumber.getText().equals(participantNumber2.getText())
  && (participantNumber.getText().equals("") == false)
  && participantNumber2.getText().equals("") == false
  && experimentNumber.getText().equals("") == false
  && experimentNumber.getText().equals("") == false)
  {
    //save to the array here
    experimentID = experimentNumber.getText();
    participantID = participantNumber.getText();
    currentScreen = 1;
  }
  else
  {
    message.setVisible(true);
  }
}
