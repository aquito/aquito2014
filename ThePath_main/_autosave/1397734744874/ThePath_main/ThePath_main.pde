import processing.data.IntList;
import controlP5.*;

Path path;
Walker walker;
Event event;
UIcontroller ui;
ControlP5 cp5;
State gamestate;

Scenario currentScenario;
Resources currentResources;
Consequence consequences;
Timer countdown;
Textbox textbox;

PImage panelbg, button;
PGraphics overview, eventview, dayview, walkeronpath, fullday, completepath, transitionsweep;
IntList eventPool; 

PFont fontHeader;
PFont fontBasic;
PFont fontButton;
PImage texture;
PImage antlers;

Day currentDay;
int maxDays;
int maxScenarios;
float startTimer;

int goldRewards;
int essenceRewards;
int gemsRewards;
int moraleChange;

int day = 0;
int gold = 1000;
int essence = 500;
int morale = 2;
int gems = 10;
int eventMax = 10; 
int eventID;
int state = 2;
int totaldays = 4;

String consequenceDescription;

int buttonX = 150;
int descriptionY = 175;
int buttonY = 250; // descriptionY + 100;
int consequenceY = buttonY + 40;

float frate = 30;
int day = 0;

int pathlength; // number of scenario days (=waypoints) on the path
float [] durations = {30, 60, 30, 120}; // durations of journey between waypoints (days) , max num of durations = pathlength + 1 if starts with path vs day 
float startTimer;
boolean pathDrawn = false;
boolean randomEvent = false;
float walkerSpeed; // n pixels per second

float duration;
float timerX;
float timerY;
float displaysecs;
float durationinms;
float endTime = 1000;

float [] pathstarts = new float[10];
float [] pathends = new float[10];

int choicemade = 0;
boolean timerFlag = false;
boolean scenarioFlag = true;
boolean pathFlag = false;
int [] choices = new int[100]; // for recording of choices
int [] scenarioIDsPerDay = new int[3];
boolean isExtendedScenario = false;

String [] scenarioItemStances = new String [4];
String [] buttons = new String [4];
String [] choiceStances = new String [4];
String speedupText;

 float walkerX;
 float walkerY; 
 float walkerXend;
 float randomeventY = 200;

void setup () {
  frameRate(frate);
  size(800, 600, P2D);
  smooth();
  background(152, 82, 8);
  
eventview = createGraphics(width, height);
overview = createGraphics(width, height);
dayview = createGraphics(width, height);
walkeronpath = createGraphics(width, height);
fullday = createGraphics(width, height);
completepath = createGraphics(width, height);
transitionsweep = createGraphics(width, height);

panelbg = loadImage("dialog_background.png");
button = loadImage("button_normal.png");

// INITIALIZE

  currentDay = new Day(day);
  currentScenario = new Scenario(day);
  currentResources = new Resources(gold, essence, gems, morale);
  
  fontHeader = loadFont("IowanOldStyle-Italic-64.vlw");
  fontButton = loadFont("Appareo-Medium-24.vlw");
  fontBasic = loadFont("Appareo-Medium-48.vlw");
  cp5.setControlFont(fontButton);
  cp5.setColorForeground(0xffaa0000);
  cp5.setColorBackground(0xff660000);
  cp5.setColorLabel(0xffdddddd);
  cp5.setColorValue(0xffff88ff);
  cp5.setColorActive(0xffff0000);

  texture = loadImage("Texture-01-byGhostlyPixels.png");
  texture.resize(800,600);

  currentScenario.displayButtons();
  currentScenario.printScenario();
  
  // add checking active scenario

cp5 = new ControlP5(this);
path = new Path(totaldays, durations);
path.drawPath();
eventPool = new IntList();
for (int i = 0; i < eventMax; i++) {
  eventPool.append(i);
}
ui = new UIcontroller(state);
walker = new Walker(day);
path.speedupButton();  
walker.initializeWalker();
  

gamestate = new State(2, true);

}  


  
void draw() {
 
  // ui controller methods called according to state 
  
 gamestate.update();

// CALL FUNCTIONALITY

  currentScenario.getDaysTotal();

if (day > maxDays) {
    println(day +" out of " + maxDays); 
    exit();   // exits if maximum days reached to avoid crash
  }

  if (scenarioFlag) {
    currentScenario.establish();
    currentResources.display();
    } 
    else if (pathFlag) {
      // run map & path
    }
    

/*
if (choicemade == 0) {
 println("...awaiting choice to be made.");
} 
*/
    if (timerFlag == true) {
      countdown.runTimer();
    }
}




void keyPressed() {
  if (key == 'g' || key == 'G') {
    path.speedup();
  } else if (key == 'n' || key == 'N') {
    path.towardsnextDay();
  } else if (key == 'w' || key == 'W') {
    walker.resumeWalker();
  } else if (key == 's' || key == 'S') {
    walker.stopWalker();
  } else if (key == '1' ) { 
    state = 1; // random event
  } else if (key == '2' ) {
    state = 2; // path
  } else if (key == '0' ) {
    state = 0; // day
  }
  if (key == 'b' || key == 'B') {
    currentDay.advanceOneDay();
  }
  else if (key == 'r' || key == 'R') {
    currentDay.resetToZero();
  }
  else if (key == 'c' || key == 'C') {
    currentScenario.cleanupButtons();
}
}


void controlEvent(ControlEvent theEvent) {

if (theEvent.isController()) { 
  
  if(theEvent.controller().name() == speedupText) {
    path.speedup();
 } else if (theEvent.controller().name() == "Continue") { // day dialog
   if (day < totaldays) {
   ui.transition();
   }
 } else if (theEvent.controller().name() == "Close") { // event dialog
   randomEvent = false;
   ui.transition();
 } 
 
 println("control event from : "+theEvent.controller().name());

 for (int i = 0; i < 4; i++) {
  if(theEvent.controller().name() == buttons[i]) {
  println("button:" + i);
  String buttonClicked = buttons [i];
  consequences = new Consequence(i);
  consequences.setConsequences(); 
  consequences.grantRewards();
  choicemade = 1;
  
  for (int itembuttons = 0; itembuttons < 4; itembuttons++) {
      if (buttons[itembuttons] != buttonClicked) {
      cp5.remove(buttons[itembuttons]);
      }
  }
  cp5.addButton("Next day", 1, width-200, height-50, 175, 32);
  }
 
 }
 
 if(theEvent.controller().name() == "Next day") {
   //currentScenario.getDaysTotal();
   if (day < maxDays) {
     choicemade = 0;
     currentDay.advanceOneDay();
 }
 }
}
