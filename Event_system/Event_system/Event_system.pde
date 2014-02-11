
// DECLARE
Scenario currentScenario;
 int day = 0;


void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentScenario = new Scenario(day);
}

void draw() {
  background(255);
  // CALL FUNCTIONALITY
  currentScenario.display();
  
}

