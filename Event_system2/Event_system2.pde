import controlP5.*;

// DECLARE
// Table scenariodata = new Table();
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
String [] buttons = {
  "", "", "", ""
};
int buttonX = 200;
int buttonY = 300;

int [] scenarioIDsPerDay = new int[3];
boolean isExtendedScenario = false;

   String [] scenarioItemStances = new String [4];
  String [] itemButtons = new String [4];
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
  // add checking active scenario
}

void draw() {
  background(129, 5, 63);
  // CALL FUNCTIONALITY

  currentScenario.getDaysTotal();

  if (day <= maxDays) {

    currentScenario.establish();
    currentScenario.displayButtons();
    currentResources.display();
  } 
  else {
    println(day +" out of " + maxDays); 
    currentDay.theEnd();   // exits if maximum days reached to avoid crash
  }

  /*

   if (keyPressed) {
   if (key == 'O' || key == 'o') {
   currentScenario.displayButtons(); // require buttonpresent options
   }
   }
   */
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
  // println(theEvent.getController().getName());

if (theEvent.isController()) { 

  for (int i =0; i < 4; i++) {
  if(theEvent.controller().name()== buttons[i]) {
  consequences = new Consequence(buttons[i]);
  consequences.displayConsequences();
  print("control event from : "+theEvent.controller().name());
  } 
   }
 }
}
    
  /*
 
   if (theEvent.controller().name() == getItems[0]) {
   //isItemChosen[items] = 1;
   
   consequenceDescription = "testing!"; // = consequenceCsv.getString(day, 3);
   print(consequenceDescription);
   }
   

/*

 currentScenario.cleanupButtons();   
 textSize(32);
 text(consequenceDescription, 200, 275);
 
 // Scenario.displayConsequences(); //execute consequence function
 // printArray(isItemChosen);
 */

