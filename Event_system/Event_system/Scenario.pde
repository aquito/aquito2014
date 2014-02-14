class Scenario {
  // GLOBAL VARIABLES 

Table scenariodata = loadTable("ScenarioData.csv", "header");
int r = 0;

// String [] [] Scenario = {{"Prologue", "Marry partner?", "1", "1", "2", "Yes", "No", "", ""}, {"Epilogue", "Arrange funeral?", "2", "1", "4", "Yes", "No", "Yes, but…", "No, but…"}};

  String ScenarioName = scenariodata.getString(day, 0);
  String ScenarioDescription = scenariodata.getString(day, 1);
  int ScenarioDay = scenariodata.getInt(day, 2);
  int ScenarioScope = scenariodata.getInt(day, 3);
  int ScenarioItemCount = scenariodata.getInt(day, 4);
  String [] ScenarioItems = {scenariodata.getString(day, 5), scenariodata.getString(day, 6), scenariodata.getString(day, 7), scenariodata.getString(day, 8)}; // make a string of choices out of array contents
  boolean ScenarioActive;

  // CONSTRUCTOR
  Scenario(int tempDay) {
  day = tempDay;
}
  
  
// FUNCTIONS
  void display() {
    fill(0,0,0); // black text color
    textSize(16);
    text("Day " + str(day), 100, 50);
    textSize(32);
    text(ScenarioName, 100, 100); // Name
    textSize(48);
    text(ScenarioDescription, 100, 200); // Scenario described
    
    while (r < ScenarioItemCount) { // choices output
    // text(ScenarioItems[r], 100, 300 + r*75);
  
     // buttons
     cp5.addButton(ScenarioItems[r])
     .setValue(0)
     .setPosition(100,300 + r * 50)
     .setSize(300,19)
     ;
     r = r + 1;
    } 
  }
 
 // MORE
 
}

