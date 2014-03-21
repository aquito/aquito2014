class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  String consequenceDescription;

  int buttonChosen;
  String choiceTaken;
  String [] choiceStance = new String [4];
  String [] rewards = new String[3];
    
 
  // CONSTRUCTOR
  Consequence (int tempbuttonChosen) {
   buttonChosen = tempbuttonChosen;
    }

 // FUNCTIONS

void setConsequences() {
 
  int consequenceColumn = buttonChosen + 2;
  consequenceDescription = consequencedata.getString(day, consequenceColumn);
        println(buttonChosen + ": " + consequenceDescription);
    choices[day] = buttonChosen;
    
    choicemade = 1;
    // printArray(choices);
     // currentScenario.cleanupButtons();
      
}

  
void showConsequences() { // countdown until next scenario
     
  background(144, 13, 107);
     textSize(24);
     float textX = width/2 - textWidth(consequenceDescription)/2;
     text(consequenceDescription, textX, 500);
   //   cp5.addButton("Next day", 1, width/2, 550, 300, 32);
     
}

void grantRewards() {
 // String rewards[] = consequencedata.getString(day, 6);  
 goldRewards = 100; // int(rewards[0]); 
 essenceRewards = 50; // rewards[1];
 gemsRewards = 2; // rewards[2];
 // rewards should be fetched from the csv based on choice
 currentResources.update();
}

}
