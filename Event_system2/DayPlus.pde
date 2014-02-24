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
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
      day = day + 1;
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
