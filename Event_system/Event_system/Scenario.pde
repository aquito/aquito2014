class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData.csv", "header");
int r = 0;
 
  String ScenarioName = scenariodata.getString(day, 0);
  String ScenarioDescription = scenariodata.getString(day, 1);
  int ScenarioDay = scenariodata.getInt(day, 2);
  int ScenarioScope = scenariodata.getInt(day, 3);
  int ScenarioItemCount = scenariodata.getInt(day, 4);
  String [] ScenarioItems = {scenariodata.getString(day, 5), scenariodata.getString(day, 6), scenariodata.getString(day, 7), scenariodata.getString(day, 8)}; // make a string of choices out of array contents
  int rowcount = scenariodata.getRowCount(); // last row 
  
  // CONSTRUCTOR
  Scenario(int tempDay) {
  day = tempDay;
  
}
    
  
// FUNCTIONS

/* void checkActiveScenarios()

if (ScenarioActive = true) {
 
}


*/
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
   if  (day > rowcount) {
     scenariodata.clearRows();
     dayFastForward.resetToZero();
   }
   else if (r < ScenarioItemCount) { // choices output
  
     // buttons
      cp5.addButton(ScenarioItems[r])
     .setValue(0) //??
     .setPosition(200, 300 + r * 40)
     .setSize(300, 32)
     ;
     r = r + 1;
   }
}
  
  
  
  // void choiceRecorder() - record choice, clear screen, initiate consequences, flag scenario as inactive (rewards, history, ...)
 // void scenarioTimer() - initiate timer (10 secs with a progress bar...eventually with not all scenarios? -> add ScenarioTimer boolean to data)
 
}

