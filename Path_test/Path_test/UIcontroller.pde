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
 
  state as origin from where transition is executed 
 */
 
  transitionsweep.beginDraw();
  transitionsweep.fill(152, 82, 8);
  transitionsweep.rect(0, 0, width, height);
  transitionsweep.endDraw();
  
  
  switch (state) {
   case 0: // can only change from and to 2 (path)
     image(transitionsweep, 0, 0); 
     gamestate = new State(2, true);
    state = 2;
     break;
     
   case 1: // path (2) only from and to option
   image(transitionsweep, 0, 0); 
   gamestate = new State(2, true);
   cp5.remove("Done");
   state = 2;
   walker.resumeWalker();
   break;
   
   case 2: // if durations [day] == 0 then changes from day (0) otherwise from event (1)
   if(randomEvent == true) {  
     gamestate = new State(1, false);
     cp5.addButton("Close", 1, 300, 450, 150, 30);
     state = 1;
   } else {
     image(transitionsweep, 0, 0); 
     gamestate = new State(0, false);
     cp5.addButton("done", 1, 300, 300, 150, 30);
    state = 0;
   }
   break;
  }
 
  println("State: " + state);

  
}

void overview() { // called upon default state (=2)
  
  image(overview, 0, 0);
  image(walkeronpath, 0, 0);
  if (day > 0) {
    image(fullday, 0, 0); 
  }
 walker.drawWalker();
path.randomEvent();
  
}

void dayfocus() { // called upon day state (=0)
  
  pathDrawn = false;
  // walker.stopWalker();
  dayview.beginDraw();
  dayview.fill(180, 175, 175);
  dayview.strokeWeight(10);  
  dayview.ellipse(width/2,height/2, 400, 400);
  dayview.endDraw();
  image(dayview, 0, 0);
  loop();
  state = 0;
}

void eventpanel() { // called upon random event states (=1)
  
  pathDrawn = true;
  // walker.stopWalker();
  eventview.beginDraw();
  eventview.fill(255, 255, 255);
  eventview.strokeWeight(5);
  eventview.rect(width/2-200, 400, 400, 150);
  eventview.endDraw();
  image(eventview, 0, 0);
  loop();
  state = 1;
}                                                                                          
 
}
