class Room {
  // GLOBAL VARIABLES
  //Table roomdata = loadTable("RoomData.csv");
  int [] roomData = {10, 10, 60, 60};
  
  /*
                        {70, 10, 60, 60}, 
                        {10, 70, 60, 60}, 
                        {70, 70, 60, 60}}
  */

 int roomX;
 int roomY;
 int roomW;
 int roomH;  
  
  // CONSTRUCTOR
  Room (int tempX, int tempY, int tempW, int tempH) {
    roomX = tempX;
   roomY = tempY;
    roomW = tempW;
   roomH = tempH;
   
  }
  
  // FUNCTIONS
  
void defineRooms(){
   
  // for (int i = 0; i < roomData.length; i++) {
      
  roomX = int(roomData [0]);
  roomY = int(roomData [1]);
  roomW = int(roomData [2]);
  roomH = int(roomData [3]);
  
  print(roomH);
  //theRoom = new Room(roomX, roomY, roomW, roomH); 
//  printArray(theRoom);
// }
}
  
  void drawRooms() {
    strokeWeight(4);
    stroke(0, 0, 0);
    fill(255,255,255);     
    rect(roomX, roomY, roomW, roomH);
}


}
