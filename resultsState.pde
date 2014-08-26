float mentalWeight;
float physicalWeight;
float temporalWeight;
float effortWeight;
float performanceWeight;
float frustrationWeight;

float totalTlxValue = 0;

void resultsState()
{
  background(155);
  cp5.hide();
  comparisonPanel.hide();
  experimentPanel.hide();
  trialPanel.hide();
  
  f = createFont("Helvetica", 48); 

  textFont(f, 20);
  textAlign(CENTER);
  text("TLx - Results", displayWidth/2 ,80);
  textAlign(LEFT);
  text("Rating", displayWidth/2 -50 ,150);
  text("Tally", displayWidth/2+100,150);
  text("Weights", displayWidth/2 + 250 ,150);
  
  text("Mental Demand", displayWidth/2-300 ,250);
  text("Physical Demand", displayWidth/2-300 ,275);
  text("Temporal Demand", displayWidth/2-300 ,300);
  text("Performance", displayWidth/2-300 ,325);
  text("Effort", displayWidth/2-300 ,350);
  text("Frustration", displayWidth/2-300 ,375);
  
  text(mentalTally, displayWidth/2+100,250);
  text(physicalTally, displayWidth/2+100,275);
  text(temporalTally, displayWidth/2+100,300);
  text(performanceTally, displayWidth/2+100,325);
  text(effortTally, displayWidth/2+100,350);
  text(frustrationTally, displayWidth/2+100,375);
  
  text(mentalRating, displayWidth/2-50,250);
  text(physicalRating, displayWidth/2-50,275);
  text(temporalRating, displayWidth/2-50,300);
  text(performanceRating, displayWidth/2-50,325);
  text(effortRating, displayWidth/2-50,350);
  text(frustrationRating, displayWidth/2-50,375);
  
  mentalWeight = (float)mentalTally/15;
  physicalWeight =  (float)physicalTally/15;
  temporalWeight = (float)temporalTally / 15;
  performanceWeight = (float)performanceTally / 15;
  effortWeight = (float)effortTally / 15;
  frustrationWeight = (float)frustrationTally / 15;
  
  text(mentalWeight, displayWidth/2+250,250);
  text(physicalWeight, displayWidth/2+250,275);
  text(temporalWeight, displayWidth/2+250,300);
  text(performanceWeight, displayWidth/2+250,325);
  text(effortWeight, displayWidth/2+250,350);
  text(frustrationWeight, displayWidth/2+250,375);
  
  text("Overall", displayWidth/2-300 ,575);
  
  float totalTlxValue = 
  ((float)mentalRating * mentalWeight) + 
  ((float)physicalRating * physicalWeight) + 
  ((float)temporalRating * temporalWeight) + 
  ((float)performanceRating * performanceWeight) + 
  ((float)effortRating * effortWeight) +
  ((float)frustrationRating * frustrationWeight);
  
  text(totalTlxValue, displayWidth/2-100 ,575);
  
  

}
