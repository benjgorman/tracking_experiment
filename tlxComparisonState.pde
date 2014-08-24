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
 
  background(155);
  
  text("OR", displayWidth/2 , displayHeight/2);
  
  
  if (comparisonNo <= 14)
    switch(comparisonNo)
    {
      case 0:
        top.captionLabel().setText("Frustration");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(FRUSTRATION);
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        break;
      case 1: 
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
        break;
      case 2: 
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        bottom.captionLabel().setText("Temporal Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(TEMPORAL);
        break;
      case 3: 
        top.captionLabel().setText("Mental Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(MENTAL);
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        break;
      case 4: 
       top.captionLabel().setText("Mental Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(MENTAL);
        bottom.captionLabel().setText("Physical Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(PHYSICAL);
        break;
      case 5: 
        top.captionLabel().setText("Effort");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(EFFORT);
        bottom.captionLabel().setText("Physical Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(PHYSICAL);
        break;
      case 6: 
        top.captionLabel().setText("Frustration");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(FRUSTRATION);
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
        break;
      case 7: 
        top.captionLabel().setText("Effort");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(EFFORT);
        bottom.captionLabel().setText("Performance");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(PERFORMANCE);
        break;
      case 8: 
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        break;
      case 9:
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        bottom.captionLabel().setText("Effort");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(EFFORT);
        break;
      case 10:
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        break;
      case 11:
        top.captionLabel().setText("Performance");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PERFORMANCE);
        bottom.captionLabel().setText("Frustration");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(FRUSTRATION);
        break;
      case 12: 
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        bottom.captionLabel().setText("Temporal Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(TEMPORAL);
        break;
      case 13:
        top.captionLabel().setText("Physical Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(PHYSICAL);
        bottom.captionLabel().setText("Performance");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(PERFORMANCE);
        break;
      case 14:
        top.captionLabel().setText("Temporal Demand");
        top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
        top.changeValue(TEMPORAL);
        bottom.captionLabel().setText("Mental Demand");
        bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
        bottom.changeValue(MENTAL);
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

