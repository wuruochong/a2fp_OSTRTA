// represents a button
public class Button {
  int[] topLeftCorner;
  int[] bottomRightCorner;
  String identifier;
  String displayText;
  int displayScreen; // state of screen that this button is printed on
  int[] textColor;
  int[] buttonColor;
  PImage img;
  
  boolean imgUsed;
  
  public Button(int[] coor1, int[] coor2, String tag, String text, int screen){
    topLeftCorner = coor1;
    bottomRightCorner = coor2;
    identifier = tag;
    displayText = text;
    textColor = new int[] {0,0,0};
    buttonColor = new int[] {255,255,255};
    displayScreen = screen;
  } 
  
  public Button (int[] coor1, int[] coor2, String tag, String text, int screen, int[] rgbText, int[] rgbButton){
    this(coor1, coor2, tag, text, screen);
    stroke(0,0, 0, 0);
    textColor = rgbText;
    buttonColor = rgbButton;
  }
  
  
  //constructuor to take name of image, 
  //button will display the image and be clickable
  
  public Button(int[] coor1, String tag, int screen, String i) {
    //displayScreen = screen;
    topLeftCorner = coor1;
    img = loadImage(i);
    int [] coor2 = {img.width + coor1[0] ,img.height + coor1[1] };
    bottomRightCorner = coor2;
    identifier = tag;
    imgUsed = true;
        displayScreen = screen;
  }
  
  void draw() {
    //if the constructor of a button image is used, load image
    if (imgUsed) {
      image(img,topLeftCorner[0],topLeftCorner[1]);
    }
    
    //else fill with rectanglular button with text
    else{
      if ( buttonColor.length > 3 )
        fill(buttonColor[0], buttonColor[1], buttonColor[2], buttonColor[3]);
      else
        fill(buttonColor[0], buttonColor[1], buttonColor[2]);
        
      rect(topLeftCorner[0], topLeftCorner[1], bottomRightCorner[0] - topLeftCorner[0], bottomRightCorner[1] - topLeftCorner[1]);
    
        if ( displayText != null ) { // if there is text to display
          fill(textColor[0], textColor[1], textColor[2]);
          textAlign(CENTER);
          text(displayText, (bottomRightCorner[0] - topLeftCorner[0]) / 2 + topLeftCorner[0], (bottomRightCorner[1] - topLeftCorner[1]) / 2 + topLeftCorner[1]);
          textAlign(RIGHT);
          //text(displayText, (int ) (topLeftCorner[0] * 1.25), (int) (topLeftCorner[1] * 1.25));
        }
    }
  }
  
  // only register button click of the button is being displayed
  public boolean buttonPressed(int state) {
    return ( state == displayScreen && mouseX >= topLeftCorner[0] && mouseX <= bottomRightCorner[0] ) && ( mouseY >= topLeftCorner[1] && mouseY <= bottomRightCorner[1] );
  }
  
  public String getID() {
    return identifier;
  }
  
}
