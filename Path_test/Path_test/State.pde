class State {
 
 // GLOBAL VARIABLES 
int uiState; // which image from buffer is shown; 0 = day, 1 = event, 2 = path

boolean walkerState; // true = walker is shown & moving, false = walker not shown & stopped
boolean pathState; // true = path is drawn, false = not

/*
new gamestate(2, true, true) = default overview
new gamestate(1, false, true) = random event
new gamestate(0, false, false) = day

*/
  
 // CONSTRUCTOR
State (int temp_uiState, boolean temp_pathState) {  // boolean temp_walkerState
  
  uiState = temp_uiState;
  // walkerState = temp_walkerState;
  pathState = temp_pathState;
  
 /* 
   switch(int(walkerState)) {
    case 0:
   walker.stopWalker();
     break;
    case 1:
    walker.drawWalker();
     break;
  }
  */ 
}
   
  // FUNCTIONS

void update() {
  
 switch(uiState) {
    case 0:
    ui.dayfocus();
     break;
    case 1:
    ui.eventpanel();
     break;
    case 2:
    ui.overview();
     break;
  }
 
 switch(int(pathState)) {
    case 0:
    // walker.stopWalker();
     break;
    case 1:
    walker.drawWalker();
    path.randomEvent();
     break;
  }

}
  
}
