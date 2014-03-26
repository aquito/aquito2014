class Day {
  // GLOBAL VARIABLES
  // static final int SAMEDAYEVENT = 1;
  // static final int TWODAYEVENT = 2;
  
 // int [] scenarioIDsPerDay;
 // boolean isExtendedScenario; // = does the scenario span multiple days?

  // CONSTRUCTOR

  Day (int temp_Day) {
    day = temp_Day;
  }

  // FUNCTIONS


  void advanceOneDay() {
    endTime = startTimer + durationinms;
    currentScenario.cleanupButtons();
    currentScenario.getDaysTotal();
    if (day < maxDays) {
    day = day + 1;
    startTimer = 0;
    currentScenario = new Scenario(day);
    currentScenario.displayButtons();
    currentScenario.printScenario();
    } else {
      println("max days reached! exiting...");
      exit();
    }
  }

  void resetToZero() {
    currentScenario.cleanupButtons();
    choicemade = 0;
    startTimer = 0;
    day = 0;
    currentScenario = new Scenario(day);
    currentScenario.establish();
    currentScenario.displayButtons();
    currentScenario.printScenario();
  }

  void theEnd() {
    exit();
  }
}

