class Resources {

  // GLOBAL VARIABLES

  String resourceNames [] = {
    "Gold", "Essence", "Gems"
  };
  
  String [] moraleStatus = {"--", "-", "0", "+", "++"};


  // CONSTRUCTOR


  Resources(int gold_temp, int essence_temp, int gems_temp, int morale_temp) {
    gold = gold_temp;
    essence = essence_temp;
    gems = gems_temp;
    morale = morale_temp;
  }

  // FUNCTIONS

  void display() {

    textSize(24);
    fill(250, 232, 91); // gold text color
    text("Gold " + str(gold), 650, 50);
    fill(145, 222, 216); // turquoise text color
    text("Essence " + str(essence), 650, 75);
    fill(237, 230, 233); // silverish text color
    text("Gems " + str(gems), 650, 100);
    fill(255, 0, 0); // silverish text color
    text("Morale " + moraleStatus[morale], 650, 125);
  }
  
  void update() {
    gold = gold + goldRewards;
    essence = essence + essenceRewards;
    gems = gems + gemsRewards;
    if(morale > 0) {
      morale = morale + moraleChange;
    }
}

}

