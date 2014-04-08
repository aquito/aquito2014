class UIcontroller {
 
 // GLOBAL VARIABLES 
int state;
boolean transitionflag = false;
  
 // CONSTRUCTOR
UIcontroller (int temp_state) {
   state = temp_state;
  }
   
  // FUNCTIONS

void transition() {
  println(state);
  background(152, 82, 8);
/*
  if (state == 0) {
    transitionflag = true;
   background(152, 82, 8);
 } else if (state == 1) {
   transitionflag = true;
  background(152, 82, 8);
 } else if (state == 2 && pathDrawn == false){
   path.drawPath(); // default, state '2'
 }  
 */ 
}

void overview() { // called upon default state (=2)
  
  if (transitionflag == true) {
  walker.resumeWalker();
  transitionflag = false;
  }
  image(overview, 0, 0);
  image(walkeronpath, 0, 0);
  walker.drawWalker();
  path.randomEvent();
  
}

void dayfocus() { // called upon day state (=1)
  transition();
  pathDrawn = false;
  walker.stopWalker();
  dayview.beginDraw();
  dayview.fill(180, 175, 175);
  dayview.strokeWeight(10);  
  dayview.ellipse(width/2,height/2, 400, 400);
  dayview.endDraw();
  image(dayview, 0, 0);
}

void eventpanel() { // called upon random event states (=0)
  transition();
  pathDrawn = false;
  walker.stopWalker();
  eventview.beginDraw();
  eventview.fill(255, 255, 255);
  eventview.strokeWeight(5);
  eventview.rect(width/2-200, 400, 400, 150);
  eventview.endDraw();
  image(eventview, 0, 0);
}                                                                                          
 
}
