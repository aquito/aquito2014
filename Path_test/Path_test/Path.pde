class Path {
  // GLOBAL VARIABLES
  
 //float [] speedupstartCost = new float[10];
  float speedupCost;
  float pixelpertimeunit;
  float pathstartX = 50;
  float pathY = height/2;
  float pathendX;
  float pathshade = 255; 
  float [] pathend = new float[10];
  float [] pathstart = new float[10];
  float randomEventtime = millis();
  int eventPick;
  
   
   // CONSTRUCTOR
   
Path (int temp_pathlength, float [] temp_durations) {

  pathlength = temp_pathlength;
  durations = temp_durations;
  
}  
   
   // FUNCTIONS
 
void drawPath() { // create path with duration (use timer class)
startTimer = millis();
pathDrawn = true;

 for (int i=0; i < pathlength; i++) {
  overview.beginDraw();
  overview.fill(pathshade, pathshade, pathshade); 
  pathstarts[i] = pathstartX;
  pathendX = pathstartX + durations[i]* 2;
  pathends[i] = pathendX;
 overview.strokeWeight(10);
   overview.line (pathstartX, pathY, pathendX, pathY);
   overview.ellipse (pathendX + 25, pathY, 50, 50);
   overview.endDraw();
   pathshade = pathshade - 50;
   pathstartX = pathendX + 50;
 }
} 


void speedupButton() {
  walker.getWalkerposition();
  walker.getWalkerEndposition();
  speedupCost = round(durations[day] - (walkerXend - walkerX)/10);
  if (durations[day] > 0) {    
  textSize(24);
  fill(255,255,255);
  speedupText = "Speed up: " + speedupCost +" Gems"; 
  }
}

void speedup() {  // reduce duration to zero with gems, start new day
 walker.getWalkerposition();
 walker.getWalkerEndposition();
 durations[day] = 0;
 walkerX = walkerXend;
 // gems = gems - speedupCost;
 // resources.update();
 stopatDay();
} 

void randomEvent() {
    if (random(100) < 0.5 && millis() > randomEventtime + durations[day]/5*1000) {
      triggerEvent();
      randomEventtime = millis();
      println("Event time: " + randomEventtime/1000);
// should add a check that a random event cannot happen before a certain threshold time after a new path begins
// also worth considering that first the exact number events (plus minus) that will happen is picked based on duration, and then their timing, enough apart but still random
 } 
}
  
void triggerEvent() { // trigger a random event
 randomEvent = true;
 eventPick = int(random(eventMax)); 
 eventID = eventPool.get(eventPick);
 eventPool.remove(eventPick);
 if (eventMax > 1) {
   eventMax = eventMax - 1;
 } else {
   exit();
   println("Exiting, ran out of random events."); // should eventually just keep going without events; on the other hand there should be a range of events per path (between days) 
 }
 println("eventID: " + eventID);
 event = new Event(eventID, walkerX, randomeventY);
 event.display();
 fill(0,0,0);
 strokeWeight(2);
  line(walkerX, pathY-9, walkerX, randomeventY); 
  randomeventY = randomeventY - 10;
 state = 1;
 ui.transition();
} 

void stopatDay() {
  durations[day] = 0;
  fullday.beginDraw();
fullday.stroke(255, 255, 255);
 fullday.strokeWeight(15);
  fullday.line (pathstarts[day], pathY, pathends[day], pathY);
  textSize(16);
  text("Day " + day, pathends[day], pathY-50);
  fullday.fill(250, 243, 18);
  fullday.strokeWeight(5);
  fullday.ellipse (pathends[day] + 25, pathY, 40, 40);
 fullday.endDraw();
 image(fullday, 0, 0);
 state = 0;
}  

void towardsnextDay() {
 if (durations[day] == 0) {
  day = day + 1;
 println(day);
 walker = new Walker(day);
 walker.initializeWalker();
 ui.transition();
 loop();
 } 
}

}
