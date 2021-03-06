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
 String [] buttons = {"a", "b", "c", "d"};
 int buttonX = 200;
 int buttonY = 300;
 int options = 0;

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
  currentScenario.presentOptions();
  
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY
  // scenariostatusNow.update();
  currentScenario.establish();
  currentResources.display();
  currentScenario.displayButtons();
 
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
    printArray(Choices);
    
    if(theEvent.controller().name()=="ScenarioItems[r]") {
    String choiceTaken = "ScenarioItems[r]";
    Choices = append(Choices, choiceTaken);
    
    dayFastForward.advanceOneDay();  // should eventually take to resolution rather than the next day...
    }
  }
 }
 
*/
  


  

