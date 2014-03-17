import controlP5.*;

// DECLARE
Table scenariodata;
Scenario[] currentScenario = new Scenario[100];
Resources currentResources;
ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
Day currentDay;
int maxDays = 10;
int daysTotal;
int maxScenarios;

int day = 1;
int gold = 1000;
int essence = 500;
int gems = 10;
String [] buttons = {
  "", "", "", ""
};
int buttonX = 200;
int buttonY = 300;
// int options = 0;
int scenarioID;
/*
String scenarioName;
String scenarioDescription;
String [] scenarioItems;
*/
String consequenceDescription;


int [] scenarioIDsPerDay = new int[3];
boolean isExtendedScenario = false;

String printScenario;
String[] getItems = new String[6];

void setup () {
  size(800, 600);
  smooth();

  // INITIALIZE
  
  scenariodata = new Table();
  scenariodata.addColumn("ScenarioID");
  scenariodata.addColumn("ScenarioName");
  scenariodata.addColumn("ScenarioDescription");
  scenariodata.addColumn("ScenarioItem1");
  scenariodata.addColumn("ScenarioItem2");
  
  TableRow newRow = scenariodata.addRow();
  newRow.setInt("ScenarioID", scenariodata.lastRowIndex());
  newRow.setString("ScenarioName", "Prologue");
  newRow.setString("ScenarioDescription", "Marry partner");
  newRow.setString("ScenarioItem1", "Yes");
  newRow.setString("ScenarioItem2", "No");
  saveTable(scenariodata, "data/ScenDataPDE.csv");
  
  currentDay = new Day(day);

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

  while (day < maxDays) {
    // currentScenario[day].establish();
    print(getItems);
    print(printScenario);
    print(daysTotal);
    print(maxScenarios);
    currentResources.display();
    maxDays = daysTotal;
  }

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

  //  /*
  // Scenario.getItems();

  if (theEvent.controller().name() == getItems[0]) {
    //isItemChosen[items] = 1;

    consequenceDescription = "testing!"; // = consequenceCsv.getString(day, 3);
    print(consequenceDescription);
  }

  // */
}

/*

 currentScenario.cleanupButtons();   
 textSize(32);
 text(consequenceDescription, 200, 275);
 
 // Scenario.displayConsequences(); //execute consequence function
 // printArray(isItemChosen);
 */


