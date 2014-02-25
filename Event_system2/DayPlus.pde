class DayPlus {
  // GLOBAL VARIABLES
int tempDay1;
  
  // CONSTRUCTOR
DayPlus() {
  day = tempDay1;
 }   

   
   // FUNCTIONS
   

   
    void advanceOneDay() {
      currentScenario.cleanupButtons();
      day = day + 1;
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
    }
    
    void resetToZero() {
      day = 1;
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
      redraw();
    }
    
    void theEnd() {
      exit(); 
      redraw();
    }
}
