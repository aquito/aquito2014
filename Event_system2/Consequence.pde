class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  String consequenceDescription;

  String [] choices = new String[100]; // for recording of choices

  String choiceTaken;
  String [] choiceStance = new String [4];


  // CONSTRUCTOR
  Consequence (String temp_choiceTaken) {
    temp_choiceTaken = choiceTaken;  
    }

 // FUNCTIONS

void displayConsequences() {
    for (int i = 0; i < 4; i++) {
      if (buttons[i] == choiceTaken) {
        consequenceDescription = consequencedata.getString(day, 2 + i);
        print(consequenceDescription);
        append(choices, choiceTaken);
      }
    }
}

   
// currentScenario.getChoices();



    // Scenario.displayConsequences(); //execute consequence function

}
