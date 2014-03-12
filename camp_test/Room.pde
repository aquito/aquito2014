class Room {
  // GLOBAL VARIABLES
  //Table roomdata = loadTable("RoomData.csv");
  int [] [] roomData = {{10, 10, 60, 60}, 
                        {70, 10, 60, 60}, 
                        {10, 70, 60, 60}, 
                        {70, 70, 60, 60}};

 int roomX;
 int roomY;
 int roomW;
 int roomH;  
  
  // CONSTRUCTOR
  Room (int []roomX, int []roomY, int []roomW, int []roomH) {
     this.roomX = roomX[];
   this.roomY = roomY[];
    this.roomW = roomW[];
   this.roomH = roomH[];
   
  }
  
  // FUNCTIONS
  
void defineRooms(){
   
   for (int i = 0; i < roomData.length; i++) {
      
  roomX[i] = roomData [i][0];
  roomY[i] = roomData [i][1];
  roomW[i] = roomData [i][2];
  roomH[i] = roomData [i][3];
  
  theRoom[i] = new Room(roomX[i], roomY[i], roomW[i], roomH[i]); 
  printArray(theRoom[i]);
 }
}
  
  void drawRooms() {
    strokeWeight(4);
    stroke(0, 0, 0);
    fill(255,255,255);     
    rect(roomX, roomY, roomW, roomH);
}


}
