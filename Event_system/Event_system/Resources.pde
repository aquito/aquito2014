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
    
    fill(0,0,0); // black text color
    textSize(16);
    text("Gold " + str(Gold), 700, 50);
    text("Essence " + str(Essence), 700, 75);
    text("Gems " + str(Gems), 700, 100);
   
}

}



