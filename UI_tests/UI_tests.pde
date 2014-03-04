import controlP5.*;

// DECLARE
ControlP5 cp5;
int r = 0;
int g = 0;
int b = 0;
String [] buttonNames = {"Yesterday", "Today...", "Next Day!"};
int i_temp;
int y_temp;
int y = 0;
int x = 70;
float w = 290;

int end = 5000;

 // INITIALIZE
void setup () {
  size(800,600);
  smooth();
  
  cp5 = new ControlP5(this);
  // setup UI elements via add*
  
  // description : a button executes after release
  // parameters  : name, value (float), x, y, width, height
  updateButton();
} 

 
 // CALL FUNCTIONALITY
 void draw() {
  background(r, g, b);
  rect(70, 20, w, 15);
  progressBar();
   }
 
 
 void controlEvent(ControlEvent theEvent) {
 
     if(theEvent.isController()) { 
    
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
    
   if(theEvent.controller().name() == buttonNames[2]) {
     r = r + 75;
     w = w + 60; // add to the progressbar length
     end = end + 1000; // add to timer as well
     updateButton();
  
      } else {
    removeButton();
    updateButton();
   }
 }

 }
 
 void updateButton(){
     int i = int(random(buttonNames.length));
     i_temp = i;
     y = y + 40;
     x = int(random(750));
       cp5.addButton(buttonNames[i],1,x,y,60,20);
 }
 
 void removeButton(){
   cp5.remove(buttonNames[i_temp]);
 }
 
 void progressBar() {
   int start = millis();
   if (start < end) {
     w = w - 1;   
 } else {
   text("TIME OUT!", width/2, height/2);
   noLoop();
 }
 }
