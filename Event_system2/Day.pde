class Day {
  // GLOBAL VARIABLES
 // static final int SAMEDAYEVENT = 1;
 // static final int TWODAYEVENT = 2;
        
  int [] scenarioIDsPerDay;
  boolean isExtendedScenario; // does the scenario span multiple days?
  
  // CONSTRUCTOR
  
 Day (int [] scenarioIDsPerDay, boolean isExtendedScenario){
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
      currentScenario = new Scenario(scenarioName, scenarioDescription, scenarioItems);
         currentScenario.establish();
    }
    
    void resetToZero() {
      day = 1;
      currentScenario = new Scenario(scenarioName, scenarioDescription, scenarioItems);
      redraw();
    }
    
    void theEnd() {
      exit(); 
      redraw();
    }
}
