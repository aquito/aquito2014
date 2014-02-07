
// DECLARE
Day currentDay; // Day [] dayArray = new Day [30];


void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentDay = new Day();
}

void draw() {
  background(255);
  
  // CALL FUNCTIONALITY
  currentDay.scenario();
  
}

