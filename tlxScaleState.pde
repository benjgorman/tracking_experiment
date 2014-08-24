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
  
  background(255);

  f = createFont("Helvetica", 48); 

  textFont(f, 32);
  textAlign(CENTER);
  text("Click on each scale at the point that best indicates your experience of the task", displayWidth/2 ,80);
  
  textFont(f, 20);
  text("Mental Demand", 325,158);
  
  String mental = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 165, 500, 100);
  
  //String mental = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 265, 500, 100);
  
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 365, 500, 100);
  
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 465, 500, 100);
  
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 565, 500, 100);
  
  textFont(f, 14);
  textAlign(LEFT);
  fill(50);
  text(mental, 655, 665, 500, 100);
  
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
  
  text("Low", 80,236);
  text("High", 560,236);
  
  text("Physical Demand", 325,258);
  
  text("Low", 80,336);
  text("High", 560,336);
  
  text("Temporal Demand", 300,360);
  
  text("Low", 80,436);
  text("High", 560,436);
 
  text("Performance", 300,460);
  
  text("Good", 80,536);
  text("Poor", 560,536);
  
  text("Effort", 300,560);
  
  text("Low", 80,636);
  text("High", 560,636);
  
  text("Frustration", 300,660);
  
  text("Low", 80,736);
  text("High", 560,736);
}

public void tlxContinueBtn() 
{
   currentScreen = 3;
}
