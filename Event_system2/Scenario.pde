class Scenario {
  // GLOBAL VARIABLES 

  Table scenariodata = loadTable("ScenarioData.csv", "header");
  int daysTotal = scenariodata.getRowCount(); // last row...ideally, eventually column for easier csv manipulation 
  int scenarioID;
  String scenarioName;
  String scenarioDescription;
  String scenarioItem1;
  String scenarioItem2;
  String scenarioItem3;
  String scenarioItem4;
   String scenarioItem1Stance;
   String scenarioItem2Stance;
   String scenarioItem3Stance;
   String scenarioItem4Stance;
  int buttonWidth;
  // boolean isExtendedScenario = boolean(scenariodata.getInt(3, day));  

  // CONSTRUCTOR
  Scenario (int temp_day) {

    day = temp_day;
    temp_day = constrain(day, 0, daysTotal);
    choicemade = 0;

    // scenario initialization

    if (temp_day > daysTotal) {
      currentDay.theEnd();
    } 
    else { 
      scenarioID = scenariodata.getInt(temp_day, 0);
      scenarioName = scenariodata.getString(temp_day, 1);
      scenarioDescription = scenariodata.getString(temp_day, 2);
      timerFlag = boolean(scenariodata.getInt(temp_day, 4));

      scenarioItem1 = scenariodata.getString(temp_day, 5);
      scenarioItem2 = scenariodata.getString(temp_day, 6);
      scenarioItem3 = scenariodata.getString(temp_day, 7);
      scenarioItem4 = scenariodata.getString(temp_day, 8);

      scenarioItem1Stance = scenariodata.getString(temp_day, 9);
      scenarioItem2Stance = scenariodata.getString(temp_day, 10);
      scenarioItem3Stance = scenariodata.getString(temp_day, 11);
      scenarioItem4Stance = scenariodata.getString(temp_day, 12);
      println("scenarioitems initialized");
    }  

    // button initialization

    if  (temp_day <= daysTotal) {
      buttons[0] = scenarioItem1; // choices output; update buttons text to current scenario
      buttons[1] = scenarioItem2;
      buttons[2] = scenarioItem3;
      buttons[3] = scenarioItem4;
      println("buttons initialized");

    } 
    else { 
      currentDay.theEnd();
    }
  }

  // FUNCTIONS

  void establish() {
    
    fill(237, 230, 233); // silverish text color
    textFont(fontHeader, 24);
    text("Day " + str(day), 20, 50);
    textFont(fontBasic, 48);
    text(scenarioName, 200, 200); // Name
    textSize(32);
    text(scenarioDescription, 200, 275); // Scenario described
    if (timerFlag) {
       countdown = new Timer(15, 100, 550, "Make your choice in...");
    }
    if (choicemade == 1) {
      float textX = width/2 - textWidth(consequenceDescription)/2;
      text(consequenceDescription, textX, height-100);
    }
  }

void printScenario() {
  println(scenarioID + ": '" + scenarioName + "' - Day " + day + " out of " + daysTotal);
  printArray(buttons);
}

  void displayButtons() {
    for (int itembuttons = 0; itembuttons < 4; itembuttons++) { //add buttons for four options unless options are blank
      if (buttons[itembuttons].length() == 0) {    
        cp5.remove(buttons[itembuttons]);
        buttons[itembuttons] = "no button";
      }
      else {
        textFont(fontBasic, 24);
        cp5.addButton(buttons[itembuttons], 1, buttonX, buttonY+itembuttons*40, 300, 32);
      }
    }
}

  void cleanupButtons() {
    cp5.remove("Next day");
    for (int itembuttons = 0; itembuttons < 4; itembuttons++) {
      if (buttons[itembuttons] != "no button") {
      cp5.remove(buttons[itembuttons]);
      }
    }
  }

  int getDaysTotal() {
    maxDays = daysTotal;
    return maxDays;
  }
}

