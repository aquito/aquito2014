class Day {
  // GLOBAL VARIABLES
  // static final int SAMEDAYEVENT = 1;
  // static final int TWODAYEVENT = 2;

  int [] scenarioIDsPerDay;
  boolean isExtendedScenario; // = does the scenario span multiple days?

  // CONSTRUCTOR

  Day (int temp_Day) {
    temp_Day = day;
    // temp_scenarioIDsPerDay[] = scenarioIDsPerDay[];
    //  temp_isExtendedScenario = isExtendedScenario;
  }

  // FUNCTIONS


  void advanceOneDay() {
    
    currentScenario.cleanupButtons();
    day = day + 1;
    loop();
    currentScenario = new Scenario(day);
    currentScenario.establish();
    currentScenario.displayButtons();
    currentScenario.printScenario();
    
  }

  void resetToZero() {
    currentScenario.cleanupButtons();
    redraw();
    loop ();
    day = 0;
    currentScenario = new Scenario(day);
    currentScenario.establish();
    currentScenario.displayButtons();
    currentScenario.printScenario();
  }

  void theEnd() {
    exit(); 
    redraw();
  }
}

