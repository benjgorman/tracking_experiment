void tlxState()
{
  background(155);
  comparisonPanel.hide();

  f = createFont("Helvetica", 48); 

  textFont(f, 40);
  textAlign(CENTER);
  text("Click Done or continue to adjust weightings", displayWidth/2 ,80);
  
  textFont(f, 20);
  text("Mental Demand", 325,158);
  
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
