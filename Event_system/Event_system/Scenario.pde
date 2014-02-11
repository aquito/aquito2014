class Scenario {
  // GLOBAL VARIABLES
  int Scenario_Id;
  int ScenarioDay;
  int ScenarioScope;
  int ScenarioItems;
  boolean ScenarioActive;
  String [] ScenarioName = {"Prologue", "Epilogue"};
  String [] ScenarioDescription = {"Marry her", "Hold funeral?"};
  String [] ScenarioItemDescriptions = {"Yes", "No"};
    // int [] ScenarioAttributes = {ScenarioId, ScenarioDay, ScenarioScope, ScenarioItems, ScenarioRewards}; 

  // CONSTRUCTOR
  Scenario(int tempDay){
  day = tempDay;
  }

// FUNCTIONS
  void display() {
    fill(0,0,0);
    textSize(16);
    text(str(day), width/2, 50);
    textSize(32);
    text(ScenarioName[day], width/2, 100); // Name
    text(ScenarioDescription[day], width/2, 150); // Scenario described
    for (int r = 0; r > 2; r++) { // REPLACE 2 WITH SCENARIOITEMS!
     text(ScenarioItemDescriptions[r], width/2 + r*30, 150 + r*50);
    } 
  }
}
