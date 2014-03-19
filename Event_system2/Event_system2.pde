import controlP5.*;

// DECLARE

Scenario currentScenario;
Resources currentResources;
Consequence consequences;
ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
Day currentDay;
int maxDays;
int maxScenarios;

int day = 0;
int gold = 1000;
int essence = 500;
int gems = 10;

int buttonX = 200;
int buttonY = 300;

int [] scenarioIDsPerDay = new int[3];
boolean isExtendedScenario = false;

String [] scenarioItemStances = new String [4];
String [] buttons = new String [4];
String [] choiceStances = new String [4];

void setup () {
  size(800, 600);
  smooth();

  // INITIALIZE

  currentDay = new Day(day);

  // initialize all the scenarios here via a loop
  currentScenario = new Scenario(day);
  currentResources = new Resources(gold, essence, gems);
  cp5 = new ControlP5(this);
   
  fontHeader = loadFont("IowanOldStyle-Italic-64.vlw");
  fontBasic = loadFont("IowanOldStyle-Italic-32.vlw");
  cp5.setControlFont(fontBasic);
  
  currentScenario.displayButtons();
  currentScenario.printScenario();
 
  // add checking active scenario
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY

  currentScenario.getDaysTotal();

  if (day <= maxDays) {

    currentScenario.establish();
    currentResources.display();
    
  } 
  else {
    println(day +" out of " + maxDays); 
    currentDay.theEnd();   // exits if maximum days reached to avoid crash
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


void controlEvent(ControlEvent theEvent) {

if (theEvent.isController()) { 

   println("control event from : "+theEvent.controller().name());

 for (int i = 0; i < 4; i++) {
  if(theEvent.controller().name() == buttons[i]) {
  println("button:" + i);
  consequences = new Consequence(i);
  consequences.displayConsequences();
 // consequences.acceptConsequences(); // enable advancing to next day
  noLoop();
 // consequences.grantRewards();
 
  } 
}

if (theEvent.isController()) {
 
 if(theEvent.controller().name() == "Next day") {
   currentScenario.getDaysTotal();
   if (day < maxDays) {
     currentDay.advanceOneDay();
 }
 }
}

 
}
}
