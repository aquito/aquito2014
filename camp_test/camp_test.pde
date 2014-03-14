// import

// DECLARE
Room [] theRoom = new Room[4];
Room theRoom1;

 float roomX;
 float roomY;
 float roomW;
 float roomH; 
 float [] room = new float[4];
 
// Room constructorRoom; 

 // INITIALIZE
void setup () {
size(800,600);
  smooth();
 // theRoom = new Room(roomX, roomY, roomW, roomH);
  theRoom1 = Room[0];
  theRoom1.defineRooms();

}

 // CALL FUNCTIONALITY
 
 void draw() {
   background(129, 5, 63);
   
 }

 

