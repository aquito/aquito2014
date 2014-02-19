class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData.csv", "header");
int r = 0;
 
  String ScenarioName = scenariodata.getString(day, 0);
  String ScenarioDescription = scenariodata.getString(day, 1);
  int ScenarioDay = scenariodata.getInt(day, 2);
  int ScenarioScope = scenariodata.getInt(day, 3);
  int ScenarioItemCount = scenariodata.getInt(day, 4);
  String [] ScenarioItems = {scenariodata.getString(day, 4), scenariodata.getString(day, 5), scenariodata.getString(day, 6), scenariodata.getString(day, 7)}; // make a string of choices out of array contents
  int days = scenariodata.getRowCount(); // last row 
  
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
   for (int options = 0; options < 4; options++) {
     if  (day <= days) {
     buttons[options] = ScenarioItems[options]; // choices output; update buttons text 
   } else { 
     scenariodata.clearRows();
     String ScenarioName = "END";
      dayFastForward.theEnd();
      }
 }
}
 
 void displayButtons() {
 for (int options = 0; options < 4; options++) { //add buttons for four options unless options are blank
    if (buttons[options] == "") {    
    //  options = options + 1;
      cp5.addButton("null", 1, buttonX, buttonY+options*40, 300, 32);
    } else {
     cp5.addButton(buttons[options], 1, buttonX, buttonY+options*40, 300, 32);
    }
  }
}  
  
  // void choiceRecorder() - record choice, clear screen, initiate consequences, flag scenario as inactive (rewards, history, ...)
 // void scenarioTimer() - initiate timer (10 secs with a progress bar...eventually with not all scenarios? -> add ScenarioTimer boolean to data)
 
}

