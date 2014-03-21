class Timer {
 
   // GLOBAL VARIABLES
  float durationinms;
  float tempDuration;
  float tempTimerX;
  float tempTimerY;
  float displaysecs;
 
  
  // CONSTRUCTOR
 Timer(float tempDuration, float tempTimerX, float tempTimerY) {
 
   duration = tempDuration;
   timerX = tempTimerX;
   timerY = tempTimerY;
   durationinms = tempDuration * 1000;
   
 }
 
    // FUNCTIONS
    
void runTimer() {

 displaysecs = (durationinms - startTimer)/1000;         
  while (displaysecs > 0) {
     loop();
     textSize(32);
     text("moving on in..." + round(displaysecs) + " seconds", 300, 550);
     println(displaysecs); 
}
  if (displaysecs == 0) {
     currentDay.advanceOneDay();
 }
}

}

