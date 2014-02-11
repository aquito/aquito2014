class Scenario {
  // GLOBAL VARIABLES 

  String [] [] Scenario = {{"Prologue", "Marry partner?", "1", "1", "2", "Yes", "No", "", ""}, 
                           {"Epilogue", "Arrange funeral?", "2", "1", "2", "Yes", "No", "Yes, but…", "No, but…"}};
  String ScenarioName = Scenario[day][0];
  String ScenarioDescription = Scenario[day][1];
  int ScenarioDay = int(Scenario[day][2]);
  int ScenarioScope = int(Scenario[day][3]);
  int ScenarioItemCount = int(Scenario[day][4]);
  String [] ScenarioItems = {Scenario[day][5], Scenario[day][6], Scenario[day][7], Scenario[day][8]};
  boolean ScenarioActive;
  
  
    // int [] ScenarioAttributes = {ScenarioId, ScenarioDay, ScenarioScope, ScenarioItems, ScenarioRewards}; 

  // CONSTRUCTOR
  Scenario(int tempDay){
  day = tempDay;
  }

// FUNCTIONS
  void display() {
    fill(0,0,0);
    textSize(16);
    text("Day " + str(day), 100, 50);
    textSize(32);
    text(ScenarioName, 100, 100); // Name
    textSize(48);
    text(ScenarioDescription, 100, 200); // Scenario described
    for (int r = 0; r < ScenarioItemCount; r++) { // REPLACE 2 WITH SCENARIOITEMS!
     text(ScenarioItems[r], 100, 300 + r*75);
    } 
  }
}
