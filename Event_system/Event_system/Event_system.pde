import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
ControlP5 cp5;
PFont font;
Scenariostatus scenariostatusNow;

 int day = 0;
 int Gold = 1000;
  int Essence = 500;
  int Gems = 10;


void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentScenario = new Scenario(day);
  currentResources = new Resources(Gold, Essence, Gems);
  cp5 = new ControlP5(this);
  font = loadFont("IowanOldStyle-Italic-64.vlw");
  scenariostatusNow = new Scenariostatus();
  
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY
  // scenariostatusNow.update();
  currentScenario.establish();
  currentResources.display();
    
  if (mouseButton == LEFT) {
  currentScenario.presentOptions();
  } 
}


