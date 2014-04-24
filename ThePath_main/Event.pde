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

 fill(0,0,0);
 textSize(20);
 text(eventdata.getString(eventID, 1), width/2-150, 400);
 textSize(16);
  text(eventdata.getString(eventID, 2), width/2-150, 430);
}  
 
  
}
