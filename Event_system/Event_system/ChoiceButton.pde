class ChoiceButton {
  // GLOBAL VARIABLES
 String [] buttons = {"a", "b", "c", "d"};
 String [] ScenarioItems = {scenariodata.getString(day, 4), scenariodata.getString(day, 5), scenariodata.getString(day, 6), scenariodata.getString(day, 7)}; // make a string of choices out of array contents
  
  // CONSTRUCTOR
   
  ChoiceButton(int tempbuttonX, int tempbuttonY, String [] tempButtons) {
  buttonX = tempbuttonX;
  buttonY = tempbuttonY;
  buttons = tempButtons;
}
   
   // FUNCTIONS
   
    void place() {
      for (int n = 0; n < 4; n = n+1) {
       cp5.addButton(ScenarioItems[n], 1, buttonX, buttonY+ n*40, 300, 32);
 
    }
 }
    
     // void update() {
      
}

