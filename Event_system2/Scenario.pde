class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData.csv", "header");
  String ScenarioName = scenariodata.getString(day, 0);
  String ScenarioDescription = scenariodata.getString(day, 1);
  int ScenarioDay = scenariodata.getInt(day, 2);
  int ScenarioScope = scenariodata.getInt(day, 3);
  int ScenarioItemCount = scenariodata.getInt(day, 4);
  String [] ScenarioItems = {scenariodata.getString(day, 4), scenariodata.getString(day, 5), scenariodata.getString(day, 6), scenariodata.getString(day, 7)}; // make a string of choices out of array contents
  int daysTotal = scenariodata.getRowCount(); // last row 
  String [] Choices; // for recording of choices
  
  // CONSTRUCTOR
  Scenario(String ScenarioName, String ScenarioDescription, String [] ScenarioItems) {
  ScenarioName = this.ScenarioName;
  ScenarioDescription = this.ScenarioDescription;
  ScenarioItems = this.ScenarioItems;
}
      
// FUNCTIONS

  void establish() {
    fill(237, 230, 233); // silverish text color
    textSize(24);
    text("Day " + str(day), 20, 50);
    textFont(font, 48);
    text(ScenarioName, 200, 200); // Name
    textSize(32);
    text(ScenarioDescription, 200, 275); // Scenario described
    
  }
  
 void presentOptions() {   

     if  (day < daysTotal) {
       for (int items = 0; items < 4; items++) {
     buttons[items] = ScenarioItems[items];
     // choices output; update buttons text 
   }} else { 
    day = daysTotal;
     String ScenarioName = "END";
      dayFastForward.theEnd();
      }
 }
 
 
 void displayButtons() {
 for (int itembuttons = 0; itembuttons < 4; itembuttons++) { //add buttons for four options unless options are blank
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
    
    dayFastForward.advanceOneDay();  // should eventually take to resolution rather than the next day...
    redraw();
  }
 }
  
  // void choiceRecorder() - record choice, clear screen, initiate consequences, flag scenario as inactive (rewards, history, ...)
 // void scenarioTimer() - initiate timer (10 secs with a progress bar...eventually with not all scenarios? -> add ScenarioTimer boolean to data)
 
}

