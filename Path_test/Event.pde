class Event {
 
 // GLOBAL VARIABLES 
Table eventdata = loadTable("EventData.csv", "header");
int eventMax = eventdata.getRowCount();
  
 // CONSTRUCTOR
Event (int temp_eventID) {
   eventID = temp_eventID;
  }
   
  // FUNCTIONS

void display() {
 fill(0,0,0);
  text(eventdata.getString(eventID, 1), 100, 400);
}  
 
  
}
