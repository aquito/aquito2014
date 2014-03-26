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
 textboxString = temp_textboxString;
 textboxFontsize = temp_textboxFontsize;
 textboxX = temp_textboxX;
 textboxY = temp_textboxY;
 textboxW = temp_textboxW;
 textboxH = temp_textboxH;
 }  
  
   // FUNCTIONS
 
 void displayTextbox() {
   fill(237, 230, 233);
   textAlign(LEFT, CENTER); 
   textFont(fontBasic, textboxFontsize);
   text(textboxString, textboxX, textboxY, textboxW, textboxH);
 } 

}
