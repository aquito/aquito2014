import controlP5.*;

Path path;
Walker walker;

ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
PFont fontButton;
PImage texture;
PImage antlers;

float frate = 30;

int day = 0;

int pathlength; // number of scenario days (=waypoints) on the path
float [] durations = {30, 60, 30, 120}; // durations of journey between waypoints (days) , max num of durations = pathlength + 1 if starts with path vs day 
float startTimer;

float [] pathstarts = new float[10];
float [] pathends = new float[10];

String speedupText;

 float walkerX;
 float walkerY; 
 float walkerXend;

void setup () {
  frameRate(frate);
  size(800, 600);
  smooth();
  background(152, 82, 8);

cp5 = new ControlP5(this);
path = new Path(4, durations);
path.drawPath();
walker = new Walker(day);
walker.initializeWalker();
path.speedupButton();
  
}
  
void draw() {
 
  walker.drawWalker();
  
}


void controlEvent(ControlEvent theEvent) {

if (theEvent.isController()) { 
  
  if(theEvent.controller().name() == speedupText) {
   // path.speedup();
 }
 }
}
