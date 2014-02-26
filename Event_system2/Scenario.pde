class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData2.csv");
  String ScenarioName = scenariodata.getString(1, day);
  String ScenarioDescription = scenariodata.getString(2, day);
  boolean isExtendedScenario = boolean(scenariodata.getInt(3, day));  
String [] ScenarioItems = {scenariodata.getString(4, day), scenariodata.getString(5, day), scenariodata.getString(6, day), scenariodata.getString(7, day)}; // make a string of choices out of array contents
  int daysTotal = scenariodata.getColumnCount(); // last column 
  String [] Choices; // for recording of choices

  
  // CONSTRUCTOR
  Scenario(String ScenarioName, String ScenarioDescription, String [] ScenarioItems) {
  ScenarioName = this.ScenarioName;
  ScenarioDescription = this.ScenarioDescription;
  ScenarioItems = this.ScenarioItems;
 
  // button initialization
  
  if  (day < daysTotal) {
       for (int items = 0; items < 4; items++) {
     buttons[items] = ScenarioItems[items]; // choices output; update buttons text to current scenario
   }} else { 
    day = daysTotal;
      currentDay.theEnd();
      }
}
      
// FUNCTIONS

  void establish() {
    fill(237, 230, 233); // silverish text color
    textSize(24);
    text("Day " + str(day), 20, 50);
    textFont(fontHeader, 48);
    text(ScenarioName, 200, 200); // Name
    textSize(32);
    text(ScenarioDescription, 200, 275); // Scenario described
  }
  
 
 void displayButtons() {
 for (int itembuttons = 0; itembuttons < 4; itembuttons++) { //add buttons for four options unless options are blank
      buttons[itembuttons] = ScenarioItems[itembuttons];
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
   
    String choiceTaken = theEvent.controller().name();
    Choices = append(Choices, choiceTaken);
    
    print("control event from : "+theEvent.controller().name());
    printArray(Choices);
    
    // execute consequence function
    
    currentDay.advanceOneDay();  // should eventually take to resolution rather than the next day...
    redraw();
  }
 }
  
 /* void choiceConsequences() {
  consequence = Choices[day];
  
  
  // (further development:) there should also be choices available which do not instantly lead to even interim resolution, but are basically follow up questions in trying to get more information before making the choice
  }
  
  */
  
  // void choiceRecorder() - record choice, clear screen, initiate consequences, flag scenario as inactive (rewards, history, ...)
 // void scenarioTimer() - initiate timer (10 secs with a progress bar...eventually with not all scenarios? -> add ScenarioTimer boolean to data)
 
}

