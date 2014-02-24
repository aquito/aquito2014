class Resources {
  
    // GLOBAL VARIABLES
  
  String ResourceNames [] = {"Gold", "Essence", "Gems"};
  
  
  // CONSTRUCTOR
   
   
    Resources(int Gold_temp, int Essence_temp, int Gems_temp){
  Gold = Gold_temp;
  Essence = Essence_temp;
  Gems = Gems_temp;
  }
   
   
   // FUNCTIONS
  
  void display(){
    
    
    textSize(24);
    fill(250, 232, 91); // gold text color
    text("Gold " + str(Gold), 650, 50);
    fill(145, 222, 216); // turquoise text color
    text("Essence " + str(Essence), 650, 75);
    fill(237, 230, 233); // silverish text color
    text("Gems " + str(Gems), 650, 100);
   
}

}



