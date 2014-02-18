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
      background(129, 5, 63);
      currentScenario = new Scenario(day);
      
    }
    
    void resetToZero() {
      day = 0;
      background(129, 5, 63);
      currentScenario = new Scenario(day);
    }
}
