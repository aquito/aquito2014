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
    redraw();
    currentScenario.cleanupButtons();
    day = day + 1;
    currentScenario = new Scenario(day);
    currentScenario.establish();
  }

  void resetToZero() {
    redraw();
    currentScenario.cleanupButtons();
    day = 0;
    currentScenario = new Scenario(day);
    currentScenario.establish();
  }

  void theEnd() {
    exit(); 
    redraw();
  }
}

