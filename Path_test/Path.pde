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
  speedupCost = round(durations[day]/10 - (walkerXend - walkerX)/10);
  speedupText = "Speed up" + speedupCost +" Gems";
  if (durations[day] > 0) {    
  textSize(24);
  // text(speedupText, 100, 500); 
  cp5.addbutton(speedupText, 1, 100, 500, 150, 30);
  }
}

void speedup() {  // reduce duration to zero with gems, start new day
 walker.getWalkerposition();
 walker.getWalkerEndposition();
 durations[day] = 0;
 walkerX = walkerXend;
} 

void triggerEvent() { // trigger a random event
  
  
} 
  
}
