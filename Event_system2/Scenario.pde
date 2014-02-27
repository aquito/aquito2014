class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData2.csv");
  String scenarioName = scenariodata.getString(1, day);
  String scenarioDescription = scenariodata.getString(2, day);
  boolean isExtendedScenario = boolean(scenariodata.getInt(3, day));  
String [] scenarioItems = {scenariodata.getString(4, day), scenariodata.getString(5, day), scenariodata.getString(6, day), scenariodata.getString(7, day)}; // make a string of choices out of array contents
  int daysTotal = scenariodata.getColumnCount(); // last column 
  String [] choices; // for recording of choices
  int [] isItemChosen = {0,0,0,0};
  
    Table consequenceCsv = loadTable("Consequences.csv", "header");
  int rows = consequenceCsv.getRowCount();
  int columns = consequenceCsv.getColumnCount();
  // consequencedata [] [] = [rows] [columns];
  String consequenceDescription;

  
  // CONSTRUCTOR
  Scenario(String scenarioName, String scenarioDescription, String [] scenarioItems) {
  scenarioName = this.scenarioName;
  scenarioDescription = this.scenarioDescription;
  scenarioItems = this.scenarioItems;
  consequenceDescription = this.consequenceDescription;
  isItemChosen = this.isItemChosen;

  // button initialization
  
  if  (day < daysTotal) {
       for (int items = 0; items < 4; items++) {
     buttons[items] = scenarioItems[items]; // choices output; update buttons text to current scenario
 }
 } else { 
    day = daysTotal;
      currentDay.theEnd();
    }
}
  
 
  
 /*
 Scenario(String consequenceDescription, int [] isItemChosen) {
  consequenceDescription = this.consequenceDescription;
  isItemChosen = this.isItemChosen;
 }
*/
      
// FUNCTIONS

  void establish() {
    fill(237, 230, 233); // silverish text color
    textSize(24);
    text("Day " + str(day), 20, 50);
    textFont(fontHeader, 48);
    text(scenarioName, 200, 200); // Name
    textSize(32);
    text(scenarioDescription, 200, 275); // Scenario described
  }
  
 
 void displayButtons() {
 for (int itembuttons = 0; itembuttons < 4; itembuttons++) { //add buttons for four options unless options are blank
      buttons[itembuttons] = scenarioItems[itembuttons];
    if (buttons[itembuttons].length() == 0) {    
      cp5.remove(buttons[itembuttons]);
    } else {
     cp5.addButton(buttons[itembuttons], 1, buttonX, buttonY+itembuttons*40, 300, 32); 
    }
  }
}  
  
  void cleanupButtons() {
    for (int itembuttons = 0; itembuttons < 4; itembuttons++) {
           cp5.remove(buttons[itembuttons]);
    }
  }
    
   void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) { 
   
    print("control event from : "+theEvent.controller().name());
    
    /* 
    String choiceTaken = theEvent.controller().name();
    Choices = append(Choices, choiceTaken);
    printArray(Choices);
    */
    
    for (int items = 0; items < 4; items++) {
    if (theEvent.controller().name() == scenarioItems[items]) {
      isItemChosen[items] = 1;
      consequenceDescription = consequenceCsv.getString(day, items + 2);
      
      currentScenario.cleanupButtons();   
     textSize(32);
     text(consequenceDescription, 200, 275);
     
     // Scenario.displayConsequences(); //execute consequence function
      printArray(isItemChosen);
    }
   }
 
  }
 }
 

 
  // (further development:) there should also be choices available which do not instantly lead to even interim resolution, but are basically follow up questions in trying to get more information before making the choice
}
  
  
  // void choiceRecorder() - record choice, clear screen, initiate consequences, flag scenario as inactive (rewards, history, ...)
 // void scenarioTimer() - initiate timer (10 secs with a progress bar...eventually with not all scenarios? -> add ScenarioTimer boolean to data)
 
