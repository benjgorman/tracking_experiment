int mentalRating = 0;
int physicalRating = 0;
int temporalRating = 0;
int performanceRating = 0;
int effortRating = 0;
int frustrationRating = 0;

void tlxState()
{
  setupPanel.hide();
  comparisonPanel.hide();
  cp5.show();
  experimentPanel.hide();
  trialPanel.hide();
  
  background(255);

  f = createFont("Helvetica", 48); 
  
  String mental = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 175, 500, 100);
  
  String physical = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(physical, 655, 275, 500, 100);
  
  String temporal = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(temporal, 655, 375, 500, 100);
  
  String performance = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(performance, 655, 470, 500, 100);
  
  String effort = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(effort, 655, 575, 500, 100);
  
  String frustration = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(frustration, 655, 675, 500, 100);
  
  fill(0);
  rect(59, 179, 520, 36);
  rect(319, 170, 0.6, 35);
  rect(59, 170, 0.6, 35);
  rect(579, 170, 0.6, 35);
  
  rect(59, 279, 520, 36);
  rect(319, 270, 0.6, 35);
  rect(59, 270, 0.6, 35);
  rect(579, 270, 0.6, 35);
  
  rect(59, 379, 520, 36);
  rect(319, 370, 0.6, 35);
  rect(59, 370, 0.6, 35);
  rect(579, 370, 0.6, 35);
  
  rect(59, 479, 520, 36);
  rect(319, 470, 0.6, 35);
  rect(59, 470, 0.6, 35);
  rect(579, 470, 0.6, 35);
  
  rect(59, 579, 520, 36);
  rect(319, 570, 0.6, 35);
  rect(59, 570, 0.6, 35);
  rect(579, 570, 0.6, 35);
  
  rect(59, 679, 520, 36);
  rect(319, 670, 0.6, 35);
  rect(59, 670, 0.6, 35);
  rect(579, 670, 0.6, 35);
  
  textFont(f, 20);
  text("Mental Demand", 260,158);
  
  text("Low", 60,236);
  text("High", 540,236);
  
  text("Physical Demand", 260,258);
  
  text("Low", 60,336);
  text("High", 540,336);
  
  text("Temporal Demand", 260,360);
  
  text("Low", 60,436);
  text("High", 540,436);
 
  text("Performance", 260,460);
  
  text("Good", 60,536);
  text("Poor", 540,536);
  
  text("Effort", 260,560);
  
  text("Low", 60,636);
  text("High", 540,636);
  
  text("Frustration", 260,660);
  
  text("Low", 60,736);
  text("High", 540,736);
}

public void tlxContinueBtn() 
{
  if(mentalRating > 0 && physicalRating > 0 && performanceRating > 0 && temporalRating  > 0 && frustrationRating > 0 && effortRating > 0)
  {
   currentScreen = 3;
  }
  else
  {
    title.setText("Sorry - A value must be selected for every scale!");
  }
}
