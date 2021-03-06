class UIcontroller {
 
 // GLOBAL VARIABLES 
int state;

  
 // CONSTRUCTOR
UIcontroller (int temp_state) {
   state = temp_state;
  }
   
  // FUNCTIONS


void zerostate() {
  
}

void transition() {
 
 /* event (state 1) can only change back to 2 (path); 
    day (0) can only change to 2; 
    path(2) can change to both but only to 1 if duration > 0 
 */
 
  switch (state) {
   case 0: // can only change from and to 2 (path)
   if (duration == 0) {
     gamestate = new State(0, false, false);
     state = 0;
   } else {
   gamestate = new State(2, true, true);
   state = 2;
   }
   break;
   case 1: // path (2) only option
   gamestate = new State(2, true, true);
   state = 2;
   break;
   case 2: // if duration > 0 then changes from event (1) otherwise from 2
   
   break;
   
  }

  
  println(state);
  transitionsweep.beginDraw();
  transitionsweep.fill(152, 82, 8);
  transitionsweep.rect(0, 0, width, height);
  transitionsweep.endDraw();
  image(transitionsweep, 0, 0);
  walker.resumeWalker();
  cp5.remove("Done");
  loop();
}

void overview() { // called upon default state (=2)
  
  image(overview, 0, 0);
  image(walkeronpath, 0, 0);
  if (day > 0) {
    image(fullday, 0, 0); 
  }
// walker.drawWalker();
// path.randomEvent();
  
}

void dayfocus() { // called upon day state (=1)
  
  pathDrawn = false;
  walker.stopWalker();
  dayview.beginDraw();
  dayview.fill(180, 175, 175);
  dayview.strokeWeight(10);  
  dayview.ellipse(width/2,height/2, 400, 400);
  dayview.endDraw();
  image(dayview, 0, 0);
  cp5.addButton("done", 1, 300, 300, 150, 30);
  loop();
}

void eventpanel() { // called upon random event states (=0)
  
  pathDrawn = false;
  walker.stopWalker();
  eventview.beginDraw();
  eventview.fill(255, 255, 255);
  eventview.strokeWeight(5);
  eventview.rect(width/2-200, 400, 400, 150);
  eventview.endDraw();
  image(eventview, 0, 0);
  cp5.addButton("Close", 1, 300, 450, 150, 30);
  loop();
}                                                                                          
 
}
