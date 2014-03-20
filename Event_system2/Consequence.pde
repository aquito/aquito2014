class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  String consequenceDescription;

  int buttonChosen;
  String choiceTaken;
  String [] choiceStance = new String [4];
  
 
  // CONSTRUCTOR
  Consequence (int tempbuttonChosen) {
   buttonChosen = tempbuttonChosen;
    }

 // FUNCTIONS

void setConsequences() {
int consequenceColumn = buttonChosen + 2;
  consequenceDescription = consequencedata.getString(day, consequenceColumn);
        println(buttonChosen + ": " + consequenceDescription);
    choices[day] = buttonChosen + 1;
    // printArray(choices);
     // currentScenario.cleanupButtons();
      
}

  
void showConsequences() { // countdown until next scenario
     
  background(144, 13, 107);
     textSize(32);
     text(consequenceDescription, 100, 400);

   //   cp5.addButton("Next day", 1, width/2, 550, 300, 32);
     
}

}
