class Textbox {
  // GLOBAL VARIABLES
  String textboxString;
  int textboxFontsize;
  
  float textboxX;
  float textboxY;
  float textboxW;
  float textboxH;
  
  
  // CONSTRUCTOR

Textbox(String temp_textboxString, int temp_textboxFontsize, float temp_textboxX, float temp_textboxY, float temp_textboxW, float temp_textboxH) {
 temp_textboxString = textboxString;
 temp_textboxFontsize = textboxFontsize;
 temp_textboxX = textboxX;
 temp_textboxY = textboxY;
 temp_textboxW = textboxW;
 temp_textboxH = textboxH;

 }  
  
   // FUNCTIONS
 
 void displayTextbox() {
   fill(237, 230, 233);
   textAlign(LEFT, CENTER); 
   textFont(fontBasic, textboxFontsize);
   text(textboxString, textboxX, textboxY, textboxW, textboxH);
 } 

}
