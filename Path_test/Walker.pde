class Walker {
 // GLOBAL VARIABLES
  
 float pixelpertimeunit; // n pixels per second
 float walkBegintime;  // displaysecs = (durationinms + endTime - startTimer)/1000; 
 int startingDay; // the day the walker will move towards
 float walkerX;
 float walkerY = height/2; // = pathY; 
 float walkerXend;
 
 // CONSTRUCTOR
Walker (int temp_startingDay) {
startingDay = temp_startingDay;

}
 
 /*
 for (int i = 0; i < pathend[i], i++) {
 fill(250, 243, 18);
 ellipse (pathStart[i], pathY, 20, 20);
 */
 
   // FUNCTIONS
   
void initializeWalker() {
   walkerX = pathstarts[startingDay];
   walkerXend = pathends[startingDay];
println("walkerX: " + walkerX);
println("walkerXend: " + walkerXend);
   }
   
void  drawWalker() {
  if(walkerX < walkerXend) {
  ellipse (walkerX, walkerY, 20, 20);
  walkerX = walkerX + 1;
} else {
  noLoop();
}

 }
}
