class Room {
  // GLOBAL VARIABLES
  //Table roomdata = loadTable("RoomData.csv");
int cols = 4;
int rows = 4;
// float roomData[][] = new float[rows][cols];
    
  float roomData[][] = {{10, 10, 60, 60}, {70, 10, 60, 60}, {10, 70, 60, 60}, {70, 70, 60, 60}};

  // CONSTRUCTOR
  Room (float tempX, float tempY, float tempW, float tempH) {
    roomX = tempX;
    roomY = tempY;  
    roomW = tempW;
    roomH = tempH;
  }

  // FUNCTIONS

  void defineRooms() {
//  /*
    for (int i = 0; i < rows; i++) {
      room[i] = {roomData[i][0], roomData[i][1], roomData[i][2], roomData[i][3]};
      roomX = room[0];
      roomY = room[1];
      roomW = room[2];
      roomH = room[3];
      
      theRoom[i] = new Room(room[i]);
// */
      printArray(roomData[1][0]);
   // }
  }
}
  void drawRoom() {

    strokeWeight(4);
    stroke(0, 0, 0);
    fill(255, 255, 255);     
    rect(roomX, roomY, roomW, roomH);
  }
}

