class Timer {
   // GLOBAL VARIABLES
  float durationinms;
  float tempDuration;
  float tempTimerX;
  float tempTimerY;
  float displaysecs;
  String timerDescription;  
  
  
  // CONSTRUCTOR
 Timer(float tempDuration, float tempTimerX, float tempTimerY, String temp_timerDescription) {
   duration = tempDuration;
   timerX = tempTimerX;
   timerY = tempTimerY;
   timerDescription = temp_timerDescription;
   durationinms = tempDuration * 1000;
 }
 
    // FUNCTIONS
    
void runTimer() {
startTimer = millis();
 displaysecs = (durationinms + endTime - startTimer)/1000; 
  if (displaysecs > 0) {
     textSize(32);
     text(timerDescription + round(displaysecs) + " seconds", timerX, timerY); // 
     // println(round(displaysecs));
}
  else if (day < maxDays) {
     currentDay.advanceOneDay(); // this should also be based on timer type i.e. next day is not necessarily always the thing to do when timer reaches zero
      }
}
}

