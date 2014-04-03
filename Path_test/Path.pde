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
 
  
   // CONSTRUCTOR
   
Path (int temp_pathlength, float [] temp_durations) {

  pathlength = temp_pathlength;
  durations = temp_durations;
  
}  
   
   // FUNCTIONS
 
void drawPath() { // create path with duration (use timer class)
startTimer = millis();

 for (int i=0; i < pathlength; i++) {
  fill(pathshade, pathshade, pathshade); 
  pathstarts[i] = pathstartX;
  pathendX = pathstartX + durations[i]* 2;
  pathends[i] = pathendX;
 strokeWeight(12);
   line (pathstartX, pathY, pathendX, pathY);
   ellipse (pathendX + 25, pathY, 50, 50);
   
   pathshade = pathshade - 50;
   pathstartX = pathendX + 50;
 }
} 


void speedupButton() {
  walker.getWalkerposition();
  walker.getWalkerEndposition();
  speedupText = "Speed up: " + speedupCost +" Gems";
  speedupCost = round(durations[day] - (walkerXend - walkerX)/10);
  if (durations[day] > 0) {    
  textSize(24);
  fill(255,255,255);
  // text(speedupText, 100, 500); 
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
      println("Event time: " + randomEventtime);
// should add a check that a random event cannot happen before a certain threshold time after a new path begins
// also worth considering that first the exact number events (plus minus) that will happen is picked based on duration, and then their timing, enough apart but still random
 } 
}
  
void triggerEvent() { // trigger a random event
 eventID = int(random(eventMax));
 println(eventID);
 event = new Event(eventID);
 event.display();
  line(walkerX, pathY-9, walkerX+1, pathY+9);
  walker.stopWalker();
} 

void stopatDay() {
  durations[day] = 0;
stroke(255, 255, 255);
 strokeWeight(15);
  line (pathstarts[day], pathY, pathends[day], pathY);
  text("Day " + day, pathends[day], pathY-50);
  fill(250,243,18);
  strokeWeight(5);
  ellipse (pathends[day] + 25, pathY, 40, 40);  
}  

void towardsnextDay() {
 if (durations[day] == 0) {
  day = day + 1;
 println(day);
 walker = new Walker(day);
 walker.initializeWalker();
 loop();
 } 
}

}
