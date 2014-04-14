import processing.data.IntList;
import controlP5.*;

Path path;
Walker walker;
Event event;
UIcontroller ui;
ControlP5 cp5;
State gamestate;
PImage panelbg, button;
PGraphics overview, eventview, dayview, walkeronpath, fullday, completepath, transitionsweep;
IntList eventPool; 

PFont fontHeader;
PFont fontBasic;
PFont fontButton;
PImage texture;
PImage antlers;

int eventMax = 10; 
int eventID;
int state = 2;

float frate = 30;
int day = 0;

int pathlength; // number of scenario days (=waypoints) on the path
float [] durations = {30, 60, 30, 120}; // durations of journey between waypoints (days) , max num of durations = pathlength + 1 if starts with path vs day 
float startTimer;
boolean pathDrawn = false;
boolean randomEvent = false;

float [] pathstarts = new float[10];
float [] pathends = new float[10];

String speedupText ="test";

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

cp5 = new ControlP5(this);
path = new Path(4, durations);
path.drawPath();
eventPool = new IntList();
for (int i = 0; i < eventMax; i++) {
  eventPool.append(i);
}
ui = new UIcontroller(state);
walker = new Walker(day);
walker.initializeWalker();
path.speedupButton();   
cp5.addButton(speedupText, 1, 100, 500, 150, 30); 

gamestate = new State(2, true, true);

}


  
void draw() {
 
  // ui controller methods called according to state 
  
  /*
 if (state == 0) {
   ui.dayfocus();
 } else if (state == 1) {
   ui.eventpanel(); 
 } else {
   ui.overview(); // default, state '2'
 }  
*/



}




void keyPressed() {
  if (key == 'g' || key == 'G') {
    path.speedup();
  } else if (key == 'n' || key == 'N') {
    path.towardsnextDay();
  } else if (key == 'c' || key == 'C') {
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
}


void controlEvent(ControlEvent theEvent) {

if (theEvent.isController()) { 
  
  if(theEvent.controller().name() == speedupText) {
    path.speedup();
 } else if (theEvent.controller().name() == "Done") {
   ui.transition();
   state = 2;
 } else if (theEvent.controller().name() == "Close") {
   ui.transition();
   state = 2;
 } 
 
 }
}
