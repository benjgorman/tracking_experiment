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

int boxsize = 200;
PFont f;
int cols, rows;

// Move the mouse across the image
// to change its value

int value = 0;
int currentScreen = 2;
int comparisonNo = -1;
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
  
 // cp5.setColorForeground(0);
  //cp5.setColorBackground(0);
  //cp5.setColorLabel(0);
  //cp5.setColorValue(255);
  //cp5.setColorActive(255);
  
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
  
  r1 = cp5.addRadioButton("radioButton")
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
         
  r2 = cp5.addRadioButton("radioButton2")
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
         
  r3 = cp5.addRadioButton("radioButton3")
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
         
  r4 = cp5.addRadioButton("radioButton4")
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

  r5 = cp5.addRadioButton("radioButton5")
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
         
         
  r6 = cp5.addRadioButton("radioButton6")
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

public void controlEvent(ControlEvent theEvent) 
{
  println(theEvent.getController().getName());
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
  }
}

public void bottomBtn(int theValue) 
{
  if (frameCount > 1)
  {
    comparisonNo++;
  }
}


boolean sketchFullScreen()
{
  return true;
  //return false;
}

int trial = 0;

void experimentalState()
{
  cp5.hide();
  comparisonPanel.hide();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*boxsize;
      int y = j*boxsize;
      fill(255);
      stroke(0);
      rect(x, y, boxsize, boxsize);
     
      fill(100, 150, 200);
      text(str(j * cols + i + 1), x + boxsize / 2, y + boxsize / 2);
    }
  }

  if (keyPressed) 
  {
    if (key == ';' && trial<23) {
      trial++;
    }
  }
  
  Square tempSquare = trials.get(trial);
   
  rect(tempSquare.xposition, tempSquare.yposition, rect_w, rect_h);
  
  text("Square:" + trial, 400, 25);
  
  text("X:" + mouseX, 20, 25);
  
  text("Y:" + mouseY, 100, 25);
  
  xposition = tempSquare.xposition;
  yposition = tempSquare.yposition;
//test
  
  if ((mouseX > xposition) && (mouseX < xposition + rect_w))
  {
      text("X ON TARGET", 160, 25);
      myPort.write('4');  //when cursor is within target
  }
  else if (mouseX > xposition + rect_w) //When cursor is on right of target
  {
    myPort.write('2');
  }
  else if (mouseX < xposition) //When cursor is on the left of target
  {
    myPort.write('1');
  }
  else
  {
    text("X NO TARGET", 160, 25);
    myPort.write('3');
  }
  if ((mouseY > yposition) && (mouseY < yposition + rect_h))
  {
      text("Y ON TARGET", 160, 65);
      myPort.write('5');  //when cursor is within target
  }
  else if (mouseY > yposition + rect_h) //When cursor is on right of target
  {
    myPort.write('6');
  }
  else if (mouseY < yposition) //When cursor is on the left of target
  {
    myPort.write('7');
  }
  else
  {
    text("Y NO TARGET", 160, 65);
    myPort.write('0');
  }
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

void comparisonState()
{
  background(155);
  cp5.hide();
  comparisonPanel.show();
  
  String s = "Comparison number: " + comparisonNo + "/15";
  
  text(s, 150 , 30);
  
  //controlP5.controller("button2").setVisible(false);  
  
  switch(comparisonNo)
  {
    case 0:
      top.captionLabel().setText("Frustration");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Effort");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 1: 
      top.captionLabel().setText("Performance");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Mental Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 2: 
      top.captionLabel().setText("Performance");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Temporal Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 3: 
      top.captionLabel().setText("Mental Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Effort");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 4: 
     top.captionLabel().setText("Mental Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Physical Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 5: 
      top.captionLabel().setText("Effort");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Physical Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 6: 
      top.captionLabel().setText("Frustration");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Mental Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 7: 
      top.captionLabel().setText("Effort");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Performance");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 8: 
      top.captionLabel().setText("Temporal Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Frustration");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 9:
      top.captionLabel().setText("Temporal Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Effort");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 10:
      top.captionLabel().setText("Physical Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Frustration");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 11:
      top.captionLabel().setText("Performance");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Frustration");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 12: 
      top.captionLabel().setText("Physical Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Temporal Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 13:
      top.captionLabel().setText("Physical Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Performance");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 14:
      top.captionLabel().setText("Temporal Demand");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("Mental Demand");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200);
      break;
    case 15:
      top.captionLabel().setText("15");
      top.setPosition(displayWidth/2-100,displayHeight/2-25-200);
      bottom.captionLabel().setText("15");
      bottom.setPosition(displayWidth/2-100,displayHeight/2-25+200); 
      break;
    default: 
      break;
  }
}

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

void draw()
{
  switch(currentScreen)
  {
  case 0: initialState(); break;
  case 1: experimentalState(); break;
  case 2: tlxState(); break;
  case 3: comparisonState(); break;
  default: background(0); break;
  }
}




void mouseMoved() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

class Square 
{ 
  int xposition, yposition, id, answer, number;
  Square (int x, int y, int ans, int num) 
  {  
    xposition = x;
    yposition = y;
    answer = ans;
    num = number;
    
  } 
}



