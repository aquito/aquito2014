class Day {
  // GLOBAL VARIABLES
  static final int SAMEDAYEVENT = 1;
  static final int TWODAYEVENT = 2;
        
  int day;
  int [] scenarioIDsPerDay;
  boolean isExtendedScenario; // does the scenario span multiple days?
  
  // CONSTRUCTOR
  
 Day (int day, int [] scenarioIDsPerDay, boolean isExtendedScenario){
   this.day = day;
   this.scenarioIDsPerDay = scenarioIDsPerDay;
  this.isExtendedScenario = isExtendedScenario; 
 }
  
  // FUNCTIONS
  
  /* 
  
  eventType(){ 
    
  }
  
   
 */
 
  void advanceOneDay() {
      currentScenario.cleanupButtons();
      day = day + 1;
      currentScenario = new Scenario(ScenarioName, ScenarioDescription, ScenarioItems);
         currentScenario.establish();
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
