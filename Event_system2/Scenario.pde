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


  // boolean isExtendedScenario = boolean(scenariodata.getInt(3, day));  


  // CONSTRUCTOR
  Scenario (int temp_day) {

    day = temp_day;

    // consequenceDescription[] = this.consequenceDescription[];
    // isItemChosen[] = this.isItemChosen[];

    // scenario initialization

    if (day > daysTotal) {
      currentDay.theEnd();
    } 
    else { 
      scenarioID = scenariodata.getInt(temp_day, 0);
      scenarioName = scenariodata.getString(temp_day, 1);
      scenarioDescription = scenariodata.getString(temp_day, 2);

      scenarioItem1 = scenariodata.getString(temp_day, 5);
      scenarioItem2 = scenariodata.getString(temp_day, 6);
      scenarioItem3 = scenariodata.getString(temp_day, 7);
      scenarioItem4 = scenariodata.getString(temp_day, 8);

      scenarioItem1Stance = scenariodata.getString(temp_day, 9);
      scenarioItem2Stance = scenariodata.getString(temp_day, 10);
      scenarioItem3Stance = scenariodata.getString(temp_day, 11);
      scenarioItem4Stance = scenariodata.getString(temp_day, 12);
    }  

    // button initialization

    if  (day <= daysTotal) {
      buttons[0] = scenarioItem1; // choices output; update buttons text to current scenario
      buttons[1] = scenarioItem2;
      buttons[2] = scenarioItem3;
      buttons[3] = scenarioItem4;
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
    textFont(fontHeader, 48);
    text(scenarioName, 200, 200); // Name
    textSize(32);
    text(scenarioDescription, 200, 275); // Scenario described
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

