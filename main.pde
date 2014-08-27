import processing.serial.*;
import java.util.*;
import controlP5.*;

final int VISUAL = 0;
final int AUDIO = 1;
final int TACTILE = 2;

final int withinTarget_X = 1;
final int withinTarget_Y = 2;
final int rightOfTarget = 3;
final int leftOfTarget = 4;
final int aboveTarget = 5;
final int belowTarget = 6;


int currentFeedbackType = VISUAL;

ControlP5 cp5, comparisonPanel, setupPanel, experimentPanel, trialPanel;

RadioButton r1, r2, r3, r4, r5, r6;
Button continueBtn;
Button top, bottom;
Button submitBang;

RadioButton feedbackType;

Textfield experimentNumber, experimentNumber2, participantNumber, participantNumber2, trialAnswer, trialAnswer2;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
int size = 25;
int scale = 200;
float xposition;
float yposition;
int square;

int trial = 0;

String experimentID;
String participantID;

int boxsize = 200;
PFont f;
int cols, rows;

int value = 0;
int currentScreen =0;
int comparisonNo = 0;
String currDirection;

Textlabel title, message, expID, partID, trialWarning;

float rect_x = displayWidth/2 - size;
float rect_y = displayHeight/2 - size;
float rect_w = scale;
float rect_h = scale;
ArrayList<Square> trials;
  
void setup()
{  
  size(displayWidth, displayHeight);
  frameRate(30);
  
  cp5 = new ControlP5(this);
  comparisonPanel = new ControlP5(this);
  setupPanel = new ControlP5(this);
  experimentPanel = new ControlP5(this);
  trialPanel =  new ControlP5(this);
  
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
  ControlFont radioFont = new ControlFont(pfont, 20);
  ControlFont textFieldFont = new ControlFont(pfont,26);
  
  
  experimentPanel.setControlFont(radioFont);
  
  feedbackType = experimentPanel.addRadioButton("feedbackType")
         .setPosition(displayWidth/2-140,displayHeight/2-150)
         .setItemWidth(40)
         .setItemHeight(40)
         .setColorForeground(color(0))
         .setColorBackground(color(155))
         .setColorActive(color(0))
         .setColorLabel(color(125))
         .setItemsPerRow(3)
         .setSpacingColumn(80)
         .addItem("Audio",VISUAL)
         .addItem("Visual",AUDIO)
         .addItem("Tactile",TACTILE)
         .toUpperCase(false)
         ;
         
        
  experimentPanel.addBang("Start")
   .setPosition(displayWidth/2-62.5,displayHeight/2-20)
   .setSize(125, 40)
   .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(20).toUpperCase(false)
   ;
   
  trialAnswer = trialPanel.addTextfield("trialAnswer")
     .setPosition(displayWidth/2-325,300)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
     trialAnswer.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Trial Answer")
     ;
     
  trialAnswer2 = trialPanel.addTextfield("trialAnswer2")
     .setPosition(displayWidth/2-325,400)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
     trialAnswer2.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Re-enter Trial Answer")
     ;
     
      trialWarning = trialPanel.addTextlabel("label")
                    .setText("Warning - one or more fields do not match!")
                    .setColor(155)
                    .setFont(createFont("Helvetica",32))
                    .setVisible(false)
                    ;
                    
                    trialWarning.setPosition(displayWidth/2-300, 200);
     
   submitBang = trialPanel.addButton("Submit")
   .setPosition(displayWidth/2+125,400)
   .setSize(125, 40)
   ;
   
   submitBang.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(20).toUpperCase(false);
   
   expID = experimentPanel.addTextlabel("experiment_id")
                    .setText("ExperimentID: ")
                    .setPosition(65, 40)
                    .setColorValue(0)
                    .setFont(createFont("Helvetica",32))
                    ;
                    
                    
   partID = experimentPanel.addTextlabel("participant_id")
                    .setText("ParticipantID: ")
                    .setPosition(65, 80)
                    .setColorValue(0)
                    .setFont(createFont("Helvetica",32))
                    ;
  
  title = cp5.addTextlabel("label") // fix me
                    .setText("ParticipantID")
                    .setPosition(65, 80)
                    .setColorValue(0)
                    .setFont(createFont("Helvetica",32))
                    ;
                    
  message = setupPanel.addTextlabel("label")
                    .setText("Warning - one or more fields do not match!")
                    .setColor(155)
                    .setFont(createFont("Helvetica",32))
                    .setVisible(false)
                    ;
                    
                    message.setPosition(displayWidth/2-300, 200);
  
  experimentNumber = setupPanel.addTextfield("experimentNumber")
     .setPosition(displayWidth/2-325,300)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
      experimentNumber.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Experiment Number")
     ;
     
    experimentNumber2 = setupPanel.addTextfield("experimentNumber2")
     .setPosition(displayWidth/2-325,400)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
      experimentNumber2.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Re-enter Experiment ID")
     ;
     
   participantNumber = setupPanel.addTextfield("participantNumber")
     .setPosition(displayWidth/2+75,300)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
      participantNumber.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Participant Number")
     ;
     
  participantNumber2 = setupPanel.addTextfield("participantNumber2")
     .setPosition(displayWidth/2+75,400)
     .setSize(250,40)
     .setFont(textFieldFont)
     ;
     
      participantNumber2.captionLabel()
     .setFont(font)
     .setSize(20)
     .toUpperCase(false)
     .setText("Re-Enter Participant Number")
     ;
     
   setupPanel.addBang("Continue")
   .setPosition(displayWidth/2+200,displayHeight/2+200)
   .setSize(125, 40)
   .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(20).toUpperCase(false)
   ;    
   
   cp5.addBang("tlxContinueBtn")
   .setPosition(displayWidth/2+485,displayHeight/2+335)
   .setSize(125, 40)
   .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(20).toUpperCase(false).setText("Continue >")
   ;    
  
  
  
  //experiment number
  //participant number
     
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

boolean sketchFullScreen()
{
  return true;
  //return false;
}


void draw()
{
  switch(currentScreen)
  {
  case 0: setupState(); break;
  case 1: experimental(); break;
  case 2: tlxState(); break;
  case 3: comparisonState(); break;
  case 4: resultsState(); break;
  default: background(0); break;
  }
}



