import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
Day currentDay;



 int day = 1;
 int gold = 1000;
 int essence = 500;
 int gems = 10;
 String [] buttons = {"","","",""};
 int buttonX = 200;
 int buttonY = 300;
 // int options = 0;
 String scenarioName;
 String scenarioDescription;
 String [] scenarioItems;
int [] scenarioIDsPerDay;
boolean isExtendedScenario;
 

void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  
  currentDay = new Day(scenarioIDsPerDay, isExtendedScenario);
  currentScenario = new Scenario(scenarioName, scenarioDescription, scenarioItems);
  currentResources = new Resources(gold, essence, gems);
  cp5 = new ControlP5(this);
  fontHeader = loadFont("IowanOldStyle-Italic-64.vlw");
  fontBasic = loadFont("IowanOldStyle-Italic-32.vlw");
  cp5.setControlFont(fontBasic);
  
  // add checking active scenario
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY

  currentScenario.establish();
  currentResources.display();

if (keyPressed) {
    if (key == 'O' || key == 'o') {
  currentScenario.displayButtons(); // present options
  }
 }
}
 
   void keyPressed() {
    if (key == 'b' || key == 'B') {
      currentDay.advanceOneDay();
    }
    else if (key == 'r' || key == 'R') {
      currentDay.resetToZero();
    }
 
}

 public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}


  

