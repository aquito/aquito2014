import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
DayPlus dayFastForward;

 int day = 1;
 int Gold = 1000;
 int Essence = 500;
 int Gems = 10;
 String [] buttons = {"","","",""};
 int buttonX = 200;
 int buttonY = 300;
 // int options = 0;
 String ScenarioName;
 String ScenarioDescription;
 String [] ScenarioItems;
 

void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
  currentResources = new Resources(Gold, Essence, Gems);
  cp5 = new ControlP5(this);
  fontHeader = loadFont("IowanOldStyle-Italic-64.vlw");
  fontBasic = loadFont("IowanOldStyle-Italic-32.vlw");
  cp5.setControlFont(fontBasic);
  dayFastForward = new DayPlus();
  // check active scenario
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY

  currentScenario.establish();
  currentScenario.presentOptions();
  currentResources.display();

if (keyPressed) {
    if (key == 'O' || key == 'o') {
  currentScenario.displayButtons();
  }
 }
}
 
   void keyPressed() {
    if (key == 'b' || key == 'B') {
      dayFastForward.advanceOneDay();
    }
    else if (key == 'r' || key == 'R') {
      dayFastForward.resetToZero();
    }
 
}

 public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}


  
