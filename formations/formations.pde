  // import controlP5.*;

int [] formation = {4,0,3,0,3}; // defines formation according to D-DMF-MF-SS-S, 4-2-3-1
int [] menuFormation;
int x;
int y;
int y1; // increment when all players on current line drawn
int r;
int [] offset = {0, 50, -50, 100, -100}; // start drawing from middle then r l r l
int evenCentering;
int centeringTest;

     

void setup (){
  size (512, 640);
  background (29,191,6);
   y = 100;
 y1 = 50;
 r = 30;
}


void draw (){
  strokeWeight (4);
  smooth();
  strokeJoin(ROUND);
  formationSetup(4,0,3,0,3);  // formationSetup(menuFormation[])
}


  

// arrayCopy (menuFormation, formation);

void formationSetup(int d, int dmf, int mf, int ss, int s) {
  
int [] formation = {d,dmf,mf,ss,s};
String f_display[] = {str(d), str(dmf), str(mf), str(ss), str(s)};

// defenders
// defensive midfielders
// midfielders
// second strikers / attcking midfielders
// out-and-out strikers

for (int n = 0; n < formation.length; n++) {
   text(f_display[n], 50, y + n * y1);
  for (int playersPerSection = 0; playersPerSection < formation[n]; playersPerSection++) {
    
    if (formation[n] % 2 == 0) {
      evenCentering = -25;
    } else {
      evenCentering = 0;
    }
    fill (255);
    ellipse (width/2 + offset[playersPerSection] + evenCentering, y + n * y1, r, r); 
    }      
}
}



/*



for (int n = 0; n < formation.length; n++) {
   
  for (int playersPerSection = 0; playersPerSection < formation[n]; playersPerSection++) {
    
    if (formation[n] % 2 == 0) {
      evenCentering = -25;
    } else {
      evenCentering = 0;
    }
    fill (255);
    ellipse (width/2 + offset[playersPerSection] + evenCentering, y + n * y1, r, r);
      
    }      

}

*/







