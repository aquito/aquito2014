class Walker {
 // GLOBAL VARIABLES
  
 float walkerSpeed; // n pixels per second
 float walkBegintime;  // displaysecs = (durationinms + endTime - startTimer)/1000; 
 int startingDay; // the day the walker will move towards
float walkerY = height/2;
 
 // CONSTRUCTOR
Walker (int temp_startingDay) {
startingDay = temp_startingDay;

}
 
   // FUNCTIONS
   
void initializeWalker() {
   walkerX = pathstarts[startingDay];
   walkerXend = pathends[startingDay];
   walkerSpeed = (walkerXend - walkerX)/(durations[day] * frate); // 30 pixels per second; 45 pixels in 30 secs
   
   // timerX = new Timer();
println("walkerX: " + walkerX);
println("walkerXend: " + walkerXend);
println("walkerSpeed: " + walkerSpeed);
   }
   
float getWalkerposition() {
  return walkerX;
}  

float getWalkerEndposition() {
  return walkerXend;
}
  
   
void  drawWalker() {
  if(walkerX < walkerXend) {
  stroke(255, 255, 255);
 strokeWeight(4); 
  ellipse (walkerX, walkerY, 10, 10);
  walkerX = walkerX + walkerSpeed;
} else {
  noLoop(); // trigger new Scenario
}

 }
}
