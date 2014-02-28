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
      currentScenario[day].cleanupButtons();
      day = day + 1;
      currentScenario[day].establish();
    }
    
    void resetToZero() {
      day = 1;
      currentScenario[day].establish();
      redraw();
    }
    
    void theEnd() {
      exit(); 
      redraw();
    }
}
