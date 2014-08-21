import processing.serial.*;
import java.util.*;
import controlP5.*;

ControlP5 cp5, comparisonPanel;

RadioButton r1, r2, r3, r4, r5, r6;
Button continueBtn;

Button top, bottom;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
int size = 25;
int scale = 200;
float xposition;
float yposition;
int square;

int trial = 0;

int boxsize = 200;
PFont f;
int cols, rows;

// Move the mouse across the image
// to change its value

int value = 0;
int currentScreen =2;
int comparisonNo = 0;
String currDirection;

float rect_x = displayWidth/2 - size;
float rect_y = displayHeight/2 - size;
float rect_w = scale;
float rect_h = scale;
ArrayList<Square> trials;
  
void setup()
{  
  size(displayWidth, displayHeight);
  
  //noStroke();
  cp5 = new ControlP5(this);
  comparisonPanel = new ControlP5(this);
  
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
  

  continueBtn = cp5.addButton("continueBtn")
     .setValue(0)
     .setPosition(850,665)
     .setSize(200,50)
     ;
     
     continueBtn.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Continue")
     .align(CENTER, CENTER)
     ;
     
   top = comparisonPanel.addButton("topBtn")
     .setValue(0)
     .setPosition(displayWidth/2-100,displayHeight/2-25)
     .setSize(200,50)
     ;
     
     top.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Top")
     .align(CENTER, CENTER)
     ;
     
  bottom = comparisonPanel.addButton("bottomBtn")
     .setValue(0)
     .setPosition(displayWidth/2-100,displayHeight/2-25)
     .setSize(200,50)
     ;
     
     bottom.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Bottom")
     .align(CENTER, CENTER)
     ;
  
  r1 = cp5.addRadioButton("mentalScale")
         .setPosition(60,180)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r1_1",1)
         .addItem("r1_2",2)
         .addItem("r1_3",3)
         .addItem("r1_4",4)
         .addItem("r1_5",5)
         .addItem("r1_6",6)
         .addItem("r1_7",7)
         .addItem("r1_8",8)
         .addItem("r1_9",9)
         .addItem("r1_10",10)
         .addItem("r1_11",11)
         .addItem("r1_12",12)
         .addItem("r1_13",13)
         .addItem("r1_14",14)
         .addItem("r1_15",15)
         .addItem("r1_16",16)
         .addItem("r1_17",17)
         .addItem("r1_18",18)
         .addItem("r1_19",19)
         .addItem("r1_20",20)
         .hideLabels()
         ;
         
  r2 = cp5.addRadioButton("physicalScale")
         .setPosition(60,280)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r2_1",1)
         .addItem("r2_2",2)
         .addItem("r2_3",3)
         .addItem("r2_4",4)
         .addItem("r2_5",5)
         .addItem("r2_6",6)
         .addItem("r2_7",7)
         .addItem("r2_8",8)
         .addItem("r2_9",9)
         .addItem("r2_10",10)
         .addItem("r2_11",11)
         .addItem("r2_12",12)
         .addItem("r2_13",13)
         .addItem("r2_14",14)
         .addItem("r2_15",15)
         .addItem("r2_16",16)
         .addItem("r2_17",17)
         .addItem("r2_18",18)
         .addItem("r2_19",19)
         .addItem("r2_20",20)
         .hideLabels()
         ;
         
  r3 = cp5.addRadioButton("temporalScale")
         .setPosition(60,380)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r3_1",1)
         .addItem("r3_2",2)
         .addItem("r3_3",3)
         .addItem("r3_4",4)
         .addItem("r3_5",5)
         .addItem("r3_6",6)
         .addItem("r3_7",7)
         .addItem("r3_8",8)
         .addItem("r3_9",9)
         .addItem("r3_10",10)
         .addItem("r3_11",11)
         .addItem("r3_12",12)
         .addItem("r3_13",13)
         .addItem("r3_14",14)
         .addItem("r3_15",15)
         .addItem("r3_16",16)
         .addItem("r3_17",17)
         .addItem("r3_18",18)
         .addItem("r3_19",19)
         .addItem("r3_20",20)
         .hideLabels()
         ;
         
  r4 = cp5.addRadioButton("performanceScale")
         .setPosition(60,480)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r4_1",1)
         .addItem("r4_2",2)
         .addItem("r4_3",3)
         .addItem("r4_4",4)
         .addItem("r4_5",5)
         .addItem("r4_6",6)
         .addItem("r4_7",7)
         .addItem("r4_8",8)
         .addItem("r4_9",9)
         .addItem("r4_10",10)
         .addItem("r4_11",11)
         .addItem("r4_12",12)
         .addItem("r4_13",13)
         .addItem("r4_14",14)
         .addItem("r4_15",15)
         .addItem("r4_16",16)
         .addItem("r4_17",17)
         .addItem("r4_18",18)
         .addItem("r4_19",19)
         .addItem("r4_20",20)
         .hideLabels()
         ;

  r5 = cp5.addRadioButton("effortScale")
         .setPosition(60,580)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r5_1",1)
         .addItem("r5_2",2)
         .addItem("r5_3",3)
         .addItem("r5_4",4)
         .addItem("r5_5",5)
         .addItem("r5_6",6)
         .addItem("r5_7",7)
         .addItem("r5_8",8)
         .addItem("r5_9",9)
         .addItem("r5_10",10)
         .addItem("r5_11",11)
         .addItem("r5_12",12)
         .addItem("r5_13",13)
         .addItem("r5_14",14)
         .addItem("r5_15",15)
         .addItem("r5_16",16)
         .addItem("r5_17",17)
         .addItem("r5_18",18)
         .addItem("r5_19",19)
         .addItem("r5_20",20)
         .hideLabels()
         ;
         
         
  r6 = cp5.addRadioButton("frustrationScale")
         .setPosition(60,680)
         .setSize(25,35)
         .setColorForeground(color(0))
         .setColorBackground(color(255))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(20)
         .setSpacingColumn(1)
         .addItem("r6_1",1)
         .addItem("r6_2",2)
         .addItem("r6_3",3)
         .addItem("r6_4",4)
         .addItem("r6_5",5)
         .addItem("r6_6",6)
         .addItem("r6_7",7)
         .addItem("r6_8",8)
         .addItem("r6_9",9)
         .addItem("r6_10",10)
         .addItem("r6_11",11)
         .addItem("r6_12",12)
         .addItem("r6_13",13)
         .addItem("r6_14",14)
         .addItem("r6_15",15)
         .addItem("r6_16",16)
         .addItem("r6_17",17)
         .addItem("r6_18",18)
         .addItem("r6_19",19)
         .addItem("r6_20",20)
         .hideLabels()
         ;
         
         
  trials = new ArrayList<Square>();  // Create an empty ArrayList
  trials.add(new Square(0,0,0,1));  // Start by adding one element
  trials.add(new Square(200,0,0,2));  // Start by adding one element
  trials.add(new Square(400,0,0,3));  // Start by adding one element
  trials.add(new Square(600,0,0,4));  // Start by adding one element
  trials.add(new Square(800,0,0,5));  // Start by adding one element
  trials.add(new Square(1000,0,0,6));  // Start by adding one element
  trials.add(new Square(0,200,0,7));  // Start by adding one element
  trials.add(new Square(200,200,0,8));  // Start by adding one element
  trials.add(new Square(400,200,0,9));  // Start by adding one element
  trials.add(new Square(600,200,0,10));  // Start by adding one element
  trials.add(new Square(800,200,0,11));  // Start by adding one element
  trials.add(new Square(1000,200,0,12));  // Start by adding one element
  trials.add(new Square(0,400,0,13));  // Start by adding one element
  trials.add(new Square(200,400,0,14));  // Start by adding one element
  trials.add(new Square(400,400,0,15));  // Start by adding one element
  trials.add(new Square(600,400,0,16));  // Start by adding one element
  trials.add(new Square(800,400,0,17));  // Start by adding one element
  trials.add(new Square(1000,400,0,18));  // Start by adding one element
  trials.add(new Square(0,600,0,19));  // Start by adding one element
  trials.add(new Square(200,600,0,20));  // Start by adding one element
  trials.add(new Square(400,600,0,21));  // Start by adding one element
  trials.add(new Square(600,600,0,22));  // Start by adding one element
  trials.add(new Square(800,600,0,23));  // Start by adding one element
  trials.add(new Square(1000,600,0,24));  // Start by adding one element
  
  Collections.shuffle(trials);
  
  println("Size :", trials.size());
  
  //  f = loadFont("ArialNarrow-48.vlw");
  f = createFont("Arial", 48); // Previous line OK, this one is just more convenient for tests
  textFont(f, 10); // No need to call it on each cell, if you don't change it
  textAlign(CENTER);
  cols = 6;
  rows = 4;

  square = (int)random(0, 24);
  //yposition = random(0.0, 24);
  
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[3]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
  
  //.println(portName);
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(r1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());
   // myColorBackground = color(int(theEvent.group().value()*50),0,0);
  }
}

// function colorA will receive changes from 
// controller with name colorA
public void continueBtn(int theValue) 
{
  if (frameCount > 1)
  {
    currentScreen = 3;
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


boolean sketchFullScreen()
{
  //return true;
  return false;
}

void initialState()
{
  cp5.hide();
  comparisonPanel.hide();
  background(255);
  fill(0);
  f = createFont("Helvetica", 48);

  textFont(f, 40);
  textAlign(CENTER);
  text("Design Guidelines of Peripheral Feedback", displayWidth/2 ,80);
  textFont(f, 20);
  text("please 'click' to begin", displayWidth/2 ,displayHeight/2);
}

void draw()
{
  switch(currentScreen)
  {
  case 0: initialState(); break;
  case 1: experimentalState(); break;
  case 2: tlxState(); break;
  case 3: comparisonState(); break;
  case 4: resultsState(); break;
  default: background(0); break;
  }
}



