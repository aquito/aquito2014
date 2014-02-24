class DayPlus {
  // GLOBAL VARIABLES
int tempDay1;  

  
  // CONSTRUCTOR
DayPlus() {
  day = tempDay1;
}   

   
   // FUNCTIONS
   

   
    void advanceOneDay() {
      day = day + 1;
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
      String [] ScenarioItems = {"","","",""};
      redraw();
      currentScenario.presentOptions();
    }
    
    void resetToZero() {
      day = 0;
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
      redraw();
    }
    
    void theEnd() {
      exit(); 
      redraw();
    }
}
