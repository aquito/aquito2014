import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
ControlP5 cp5;

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
  
}

void draw() {
  background(255);
  // CALL FUNCTIONALITY
  currentScenario.display();
  currentResources.display();
  
}


