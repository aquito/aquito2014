class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  

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
}

  
void showConsequences() {

  
 float textX = width/2 - textWidth(consequenceDescription)/2;
 float textY =  height-100; 
 /*
  textbox = new Textbox(consequenceDescription, 24, textX, textY, 400, 300);
  textbox.displayTextbox();
  */
   textSize(24);
   fill(237, 230, 233);  
     text(consequenceDescription, textX, textY);
     timerFlag = false;
    cp5.addButton("Next day", 1, width-200, height-50, 175, 32);

}

void grantRewards() {
 String rewards = consequencedata.getString(day, 6);  
 goldRewards = 100; // int(rewards.substring(1,4)); // int(rewards[0]); 
 essenceRewards = 50; // rewards[1];
 gemsRewards = 2; // rewards[2];
 // rewards should be fetched from the csv based on choice
 moraleChange = -1;
 currentResources.update();
}

}
