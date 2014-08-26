int mentalTally = 0;
int physicalTally =0;
int temporalTally = 0;
int performanceTally = 0;
int frustrationTally = 0;
int effortTally = 0;

final int MENTAL = 0;
final int PHYSICAL = 1;
final int TEMPORAL = 2;
final int PERFORMANCE = 3;
final int FRUSTRATION = 4;
final int EFFORT = 5;

void comparisonState()
{
  cp5.hide();
  setupPanel.hide();
  comparisonPanel.show();
  experimentPanel.hide();
  trialPanel.hide();
  
  f = createFont("Helvetica", 48); 
background(255);
  fill(0);
  textFont(f, 26);
  textAlign(CENTER);
  text("Click on the factor that represents the more important contributor to workload for the task", displayWidth/2 ,80);
 
  
  
  text("OR", displayWidth/2-310, displayHeight/2);
  
  
  if (comparisonNo <= 14)
    switch(comparisonNo)
    {
      case 0:
        top.captionLabel().setText("Frustration");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(FRUSTRATION);
        String tops = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        String bottoms = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 1:
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        
        tops = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
        
        bottoms = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 2: 
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        
        tops = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Temporal Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(TEMPORAL);
        
        bottoms = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 3: 
        top.captionLabel().setText("Mental Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(MENTAL);
        
        tops = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        
        bottoms = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 4: 
       top.captionLabel().setText("Mental Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(MENTAL);
        
        tops = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Physical Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(PHYSICAL);
        
        bottoms = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 5: 
        top.captionLabel().setText("Effort");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(EFFORT);
        
        tops = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Physical Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(PHYSICAL);
        
        bottoms = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 6: 
        top.captionLabel().setText("Frustration");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(FRUSTRATION);
        
        tops = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
        
        bottoms = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 7: 
        top.captionLabel().setText("Effort");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(EFFORT);
        
        tops = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Performance");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(PERFORMANCE);
        
        bottoms = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 8: 
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        
        tops = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        
        bottoms = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 9:
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        
        tops = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        
        bottoms = "How hard did you have to work (mentally and physically) to accomplish your level of performance?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 10:
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        
        tops = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        
        bottoms = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 11:
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        
        tops = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        
        bottoms = "How insecure, discouraged, irritated, stressed and annoyed versus secure, gratified, content, relaxed and complacent did you feel during the task?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 12: 
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        
        tops = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Temporal Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(TEMPORAL);
        
        bottoms = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        
        break;
      case 13:
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        
        tops = "How much physical activity was required (e.g. pushing, pulling, turning, controlling, activating, etc)? Was the task easy or demanding, slow or brisk, slack or strenuous, restful or laborious?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        
        bottom.captionLabel().setText("Performance");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(PERFORMANCE);
        
        bottoms = "How successful do you think you were in accomplishing the goals of the task set by the experimenter (or yourself)? How satisfied were you with your performance in accomplishing these goals?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      case 14:
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-400,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        
        tops = "How much time pressure did you feel due to the rate of pace at which the tasks or task elements occurred? Was the pace slow and leisurely or rapid and frantic?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(tops, displayWidth/2-100, displayHeight/2-25-200, 500, 100);
        
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-400,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
        
        bottoms = "How much mental and perceptual activity was required (e.g. thinking, deciding, calculating, remembering, looking, searching, etc)? Was the task easy or demanding, simple or complex, exacting or forgiving?";
        textFont(f, 14);
        textAlign(LEFT);
        fill(50);
        text(bottoms, displayWidth/2-100, displayHeight/2-25+200, 500, 100);
        break;
      default: 
        break;

  }
  else
  {
      javax.swing.JOptionPane.showMessageDialog(null, "Comparisons Complete");
      currentScreen = 4;
  }
}

public void topBtn(int theValue) 
{
  if (frameCount > 1)
  {
    comparisonNo++;
    
    switch(theValue)
    {
      case FRUSTRATION:
        frustrationTally++;
      break;
      case MENTAL:
        mentalTally++;
      break;
      case PHYSICAL:
        physicalTally++;
      break;
      case TEMPORAL:
        temporalTally++;
      break;
      case PERFORMANCE:
        performanceTally++;
      break;
      case EFFORT:
        effortTally++;
      break;
    }
  }
}

public void bottomBtn(int theValue) 
{
  if (frameCount > 1 )
  {
    comparisonNo++;
    
    switch(theValue)
    {
      case FRUSTRATION:
        frustrationTally++;
      break;
      case MENTAL:
        mentalTally++;
      break;
      case PHYSICAL:
        physicalTally++;
      break;
      case TEMPORAL:
        temporalTally++;
      break;
      case PERFORMANCE:
        performanceTally++;
      break;
      case EFFORT:
        effortTally++;
      break;
    }
  }
}

void mentalScale(int a) 
{
  mentalRating = a * 5;
  println("Mental: " +mentalRating);
}

void physicalScale(int a) 
{
  physicalRating = a * 5;
   println("Physical: " +physicalRating);
}

void temporalScale(int a) 
{
  temporalRating = a * 5;
   println("Temporal: " +temporalRating);
}

void performanceScale(int a) 
{
  performanceRating = a * 5;
  println("Performance: " +performanceRating);
}

void effortScale(int a) 
{
  effortRating = a * 5;
  println("Effort: " +effortRating);
}

void frustrationScale(int a) 
{
  frustrationRating = a * 5;
  println("Frustration: " +frustrationRating);
}

