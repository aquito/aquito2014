class Event {
 
 // GLOBAL VARIABLES 
Table eventdata = loadTable("EventData.csv", "header");
int eventMax = eventdata.getRowCount();
  
 // CONSTRUCTOR
Event (int temp_eventID, float temp_walkerX, float temp_randomeventY) {
   eventID = temp_eventID;
   walkerX = temp_walkerX;
   randomeventY = temp_randomeventY;
  }
   
  // FUNCTIONS

void display() {
  
 // UIcontroller.eventpanel();
 fill(0,0,0);
 textSize(10);
 text(eventdata.getString(eventID, 1), walkerX + 3, randomeventY);
}  
 
  
}
