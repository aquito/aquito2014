class Consequence {
  // GLOBAL VARIABLES

  Table consequencedata = loadTable("Consequences.csv", "header");
  

  int buttonChosen;
  String choiceTaken;
  String [] history = new String [100];
  String [] choiceStance = new String [4];
  String [] rewards = new String[3];
    
 
  // CONSTRUCTOR
  Consequence (int tempbuttonChosen) {
   buttonChosen = tempbuttonChosen;
    }

 // FUNCTIONS

void setConsequences() {
 println("Choice made");
  int consequenceColumn = buttonChosen + 2;
  consequenceDescription = consequencedata.getString(day, consequenceColumn);
        println(buttonChosen + ": " + consequenceDescription);
    choices[day] = buttonChosen;
    history[day] = consequenceDescription;
}

  
void showConsequences() {
 timerFlag = false;
 float textX = 150; // width/2 - textWidth(consequenceDescription)/2;
 textbox = new Textbox(consequenceDescription, 24, textX, height-250, 500, 200);
  textbox.displayTextbox();
   
   /*
   textSize(24);
   fill(237, 230, 233);  
   text(consequenceDescription, 150, textY, 300, 200);
    */
}

void grantRewards() {
 String rewards = consequencedata.getString(day, 6);  
 goldRewards = 100; // int(rewards.substring(1,4)); // int(rewards[0]); 
 essenceRewards = 50; // rewards[1];
 gemsRewards = 2; // rewards[2];
 // rewards should be fetched from the csv based on choice
 moraleChange = int(random(-2,2));
 currentResources.update();
}

}
