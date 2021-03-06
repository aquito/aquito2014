import controlP5.*;

// DECLARE
Scenario currentScenario;
Resources currentResources;
Consequence consequences;
Timer countdown;
Textbox textbox;

ControlP5 cp5;
PFont fontHeader;
PFont fontBasic;
PFont fontButton;
PImage texture;
PImage antlers;

Day currentDay;
int maxDays;
int maxScenarios;
float startTimer;

int day = 0;
int gold = 1000;
int essence = 500;
int morale = 2;
int gems = 10;

int goldRewards;
int essenceRewards;
int gemsRewards;
int moraleChange;

String consequenceDescription;

int buttonX = 150;
int descriptionY = 175;
int buttonY = 250; // descriptionY + 100;
int consequenceY = buttonY + 40;

float duration;
float timerX;
float timerY;
float displaysecs;
float durationinms;
float endTime = 1000;

int choicemade = 0;
boolean timerFlag = false;
boolean scenarioFlag = true;
boolean pathFlag = false;
int [] choices = new int[100]; // for recording of choices
int [] scenarioIDsPerDay = new int[3];
boolean isExtendedScenario = false;

String [] scenarioItemStances = new String [4];
String [] buttons = new String [4];
String [] choiceStances = new String [4];
 

void setup () {
  size(800, 600);
  smooth();

  // INITIALIZE

  currentDay = new Day(day);
  currentScenario = new Scenario(day);
  currentResources = new Resources(gold, essence, gems, morale);
  cp5 = new ControlP5(this);
  
  fontHeader = loadFont("IowanOldStyle-Italic-64.vlw");
  fontButton = loadFont("Appareo-Medium-24.vlw");
  fontBasic = loadFont("Appareo-Medium-48.vlw");
  cp5.setControlFont(fontButton);
  cp5.setColorForeground(0xffaa0000);
  cp5.setColorBackground(0xff660000);
  cp5.setColorLabel(0xffdddddd);
  cp5.setColorValue(0xffff88ff);
  cp5.setColorActive(0xffff0000);

  texture = loadImage("Texture-01-byGhostlyPixels.png");
  texture.resize(800,600);

  currentScenario.displayButtons();
  currentScenario.printScenario();
  
  // add checking active scenario
}

void draw() {
  background(152, 82, 8); // idea: tie UI colors to choice stances; UI becomes darker/more 'corrupt' etc
  image(texture, 0, 0);
  
  // CALL FUNCTIONALITY

  currentScenario.getDaysTotal();

if (day > maxDays) {
    println(day +" out of " + maxDays); 
    exit();   // exits if maximum days reached to avoid crash
  }

  if (scenarioFlag) {
    currentScenario.establish();
    currentResources.display();
    } 
    else if (pathFlag) {
      // run map & path
    }
    

/*
if (choicemade == 0) {
 println("...awaiting choice to be made.");
} 
*/
    if (timerFlag) {
      countdown.runTimer();
    }
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    currentDay.advanceOneDay();
  }
  else if (key == 'r' || key == 'R') {
    currentDay.resetToZero();
  }
  else if (key == 'c' || key == 'C') {
    currentScenario.cleanupButtons();
}
}

void controlEvent(ControlEvent theEvent) {

if (theEvent.isController()) { 

   println("control event from : "+theEvent.controller().name());

 for (int i = 0; i < 4; i++) {
  if(theEvent.controller().name() == buttons[i]) {
  println("button:" + i);
  String buttonClicked = buttons [i];
  consequences = new Consequence(i);
  consequences.setConsequences(); 
  consequences.grantRewards();
  choicemade = 1;
  
  for (int itembuttons = 0; itembuttons < 4; itembuttons++) {
      if (buttons[itembuttons] != buttonClicked) {
      cp5.remove(buttons[itembuttons]);
      }
  }
  cp5.addButton("Next day", 1, width-200, height-50, 175, 32);
  }
}

if (theEvent.isController()) {
 
 if(theEvent.controller().name() == "Next day") {
   //currentScenario.getDaysTotal();
   if (day < maxDays) {
     choicemade = 0;
     currentDay.advanceOneDay();
 }
 }
}

 
}
}
