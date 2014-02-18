import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
ControlP5 cp5;
PFont font;
Scenariostatus scenariostatusNow;
DayPlus dayFastForward;

 int day = 0;
 int Gold = 1000;
  int Essence = 500;
  int Gems = 10;
 
  String [] Choices; // for recording of choices


void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentScenario = new Scenario(day);
  currentResources = new Resources(Gold, Essence, Gems);
  cp5 = new ControlP5(this);
  font = loadFont("IowanOldStyle-Italic-32.vlw");
  cp5.setControlFont(font);
  scenariostatusNow = new Scenariostatus();
  dayFastForward = new DayPlus();
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
 
  
   void keyPressed() {
    if (key == 'b' || key == 'B') {
      dayFastForward.advanceOneDay();
    }
    else if (key == 'r' || key == 'R') {
      dayFastForward.resetToZero();
    }
 
}
 
 /*
    void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) { 
    
    print("control event from : "+theEvent.controller().name());
    printArray(" " + Choices);
    
    if(theEvent.controller().name()=="ScenarioItems[r]") {
    append(Choices, "ScenarioItems[r]");
    day = day + 1;
    }
  }
 }
 
 */
  


  

