class Path {
  // GLOBAL VARIABLES
  
  float [] speedupstartCost = new float[10];
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
  pathendX = pathstartX + durations[i]* 1.5;
  pathends[i] = pathendX;
 strokeWeight(4);
   line (pathstartX, pathY, pathendX, pathY);
   ellipse (pathendX + 25, pathY, 50, 50);
   
   pathshade = pathshade - 50;
   pathstartX = pathendX + 50;
 
 }
   
 // length of path between days relative to duration
 // speed of progress relative to length & duration
 // line - ellipse - line - ellipse loop
 // visually indicate active, ongoing path & how much left
} 



void speedup() {  // reduce duration to zero with gems, start new day

 // speedupstartCost[i] = durations[i]/10;
 // cp5.addbutton (if duration >0); // show price, speedupstartCost comes down relative to duration left 
 // duration[x] = 0;
 
} 

void triggerEvent() { // trigger a random event
  
  
} 
  
}
