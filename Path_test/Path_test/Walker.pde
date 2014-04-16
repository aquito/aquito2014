class Walker {
 // GLOBAL VARIABLES
  

 float walkBegintime;  // displaysecs = (durationinms + endTime - startTimer)/1000; 
 int startingDay; // the day the walker will move towards
float walkerY = height/2;
float storeWalkerspeed;
 
 // CONSTRUCTOR
Walker (int temp_startingDay) {
startingDay = temp_startingDay;

}
 
   // FUNCTIONS
   
void initializeWalker() { 
  walkerX = pathstarts[startingDay];
   walkerXend = pathends[startingDay];
   walkerSpeed = (pathends[day] - pathstarts[day])/(durations[day] * frate); // 30 pixels per second; 45 pixels in 30 secs
   
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
  walkeronpath.beginDraw();
    walkeronpath.stroke(255, 255, 255);
 walkeronpath.strokeWeight(4);
 walkeronpath.fill(255, 255, 255); 
  walkeronpath.ellipse (walkerX, walkerY, 10, 10);
   walkeronpath.endDraw();
  walkerX = walkerX + walkerSpeed;
} else {
  path.stopatDay();
  // noLoop(); // trigger new Scenario  
  }
 }
 
void stopWalker() {
 storeWalkerspeed = walkerSpeed;
 walkerSpeed = 0;
 println("Walker stopped");
 noLoop();
} 
 
void resumeWalker() {
  if (walkerSpeed == 0) {
walkerSpeed = storeWalkerspeed;
randomEvent = false;
state = 2;
println("Walker resumes");
println(walkerSpeed);
loop();
  }
}

}
