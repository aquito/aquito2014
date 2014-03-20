class Timer {
 
   // GLOBAL VARIABLES
  float durationinms;
  float tempDuration;
  float tempTimerX;
  float tempTimerY;
  float displaysecs;
  float start;
  
  
  // CONSTRUCTOR
 Timer(float tempDuration, float tempTimerX, float tempTimerY) {
 
   duration = tempDuration;
   timerX = tempTimerX;
   timerY = tempTimerY;
   durationinms = tempDuration * 1000;
   
 }
 
    // FUNCTIONS
    
void runTimer() {

 if (choices[day] != 0) { 
 
 start = millis();
 
 displaysecs = (durationinms - start)/1000;         
   if (displaysecs > 0) {
     loop();
     textSize(32);
     text("moving on in..." + round(displaysecs) + " seconds", 400, 550);
     println(displaysecs);
   }
   
  } else {
   displaysecs = duration;
  } 
   
   if (displaysecs == 0) {
     currentDay.advanceOneDay();
     noLoop();
 } 
 
}

boolean isTimerOn() {
  return millis() > 0;
}
}

