class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  String consequenceDescription;

  String [] choices = new String[100]; // for recording of choices

  int buttonChosen;
  String choiceTaken;
  String [] choiceStance = new String [4];


  // CONSTRUCTOR
  Consequence (int tempbuttonChosen) {
   buttonChosen = tempbuttonChosen;
    }

 // FUNCTIONS

void displayConsequences() {
int consequenceColumn = buttonChosen + 2;
  consequenceDescription = consequencedata.getString(day, consequenceColumn);
        println(buttonChosen + ": " + consequenceDescription);
    //    append(choices, temp_buttonChosen);
     // currentScenario.cleanupButtons();
      
}

void acceptConsequences() { // countdown until next scenario
     
     textSize(32);
     text(consequenceDescription, 200, 500);
      
  // cp5.addButton("Next day", 1, width/2, 550, 300, 32);
}

}
