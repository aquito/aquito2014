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
  transitionflag = true;
}

void overview() { // called upon default state (=2)
  if (transitionflag == true) {
  walker.resumeWalker();
  transitionflag = false;
  }
  walker.drawWalker();
  path.randomEvent();
}

void dayfocus() { // called upon day state (=1)
  transition();
  walker.stopWalker();
  fill(180, 175, 175);
  strokeWeight(10);  
  ellipse(width/2,height/2, 400, 400);  
}

void event() { // called upon random event states (=0)
  transition();
  walker.stopWalker();
  fill(255, 255, 255);
  strokeWeight(5); 
  rect(width/2-100, 200, 400, 150);
}                                                                                          

void storeState() {
 
}
   



}
