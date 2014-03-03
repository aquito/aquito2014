import controlP5.*;

// DECLARE
Scenario[] currentScenario;
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
  int scenarioID;
 String scenarioName;
 String scenarioDescription;
 String [] scenarioItems;
int [] scenarioIDsPerDay;
boolean isExtendedScenario;
String consequenceDescription;

String[] getItems = new String[4];

void setup () {
  size(800,600);
  smooth();
  
  // INITIALIZE
  currentDay = new Day(scenarioIDsPerDay, isExtendedScenario);
 
 // initialize all the scenarios here via a loop
 
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

  currentScenario[day].establish();
  currentResources.display();
  

if (keyPressed) {
    if (key == 'O' || key == 'o') {
  currentScenario[day].displayButtons(); // present options
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
    
    /*
    Scenario.getItems();
    if (theEvent.controller().name() == getItems[0]) {
      //isItemChosen[items] = 1;
      
      consequenceDescription = "testing!"; // = consequenceCsv.getString(day, 3);
      print(consequenceDescription);
      
    }
    */
}

/*

      currentScenario.cleanupButtons();   
      textSize(32);
      text(consequenceDescription, 200, 275);
     
     // Scenario.displayConsequences(); //execute consequence function
     // printArray(isItemChosen);
*/

  

