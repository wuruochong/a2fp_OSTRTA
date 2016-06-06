// represents a button
public class Button {
  int[] topLeftCorner;
  int[] bottomRightCorner;
  String identifier;
  String displayText;
  int[] textColor;
  int[] buttonColor;
  PImage img;
  
  boolean imgUsed;
  
  public Button(int[] coor1, int[] coor2, String tag, String text){
    topLeftCorner = coor1;
    bottomRightCorner = coor2;
    identifier = tag;
    displayText = text;
    textColor = new int[] {0,0,0};
    buttonColor = new int[] {255,255,255};
  } 
  
  public Button (int[] coor1, int[] coor2, String tag, String text, int[] rgbText, int[] rgbButton){
    this(coor1, coor2, tag, text);
    textColor = rgbText;
    buttonColor = rgbButton;
  }
  
  
  //constructuor to take name of image, 
  //button will display the image and be clickable
  
  public Button(int[] coor1, String tag, String i) {
    topLeftCorner = coor1;
    img = loadImage(i);
    int [] coor2 = {img.width + coor1[0] ,img.height + coor1[1] };
    bottomRightCorner = coor2;
    identifier = tag;
    imgUsed = true;
  }
  
  void draw() {
    //if the constructor of a button image is used, load image
    if (imgUsed) {
    image(img,topLeftCorner[0],topLeftCorner[1]);
    }
    
    //else fill with rectanglular button with text
    else{
    fill(buttonColor[0], buttonColor[1], buttonColor[2]);
    rect(topLeftCorner[0], topLeftCorner[1], bottomRightCorner[0] - topLeftCorner[0], bottomRightCorner[1] - topLeftCorner[1]);
    
    fill(textColor[0], textColor[1], textColor[2]);
    text(displayText, (int ) (topLeftCorner[0] * 1.25), (int) (topLeftCorner[1] * 1.25));
 }
  }
  
  public boolean buttonPressed() {
    return ( mouseX >= topLeftCorner[0] && mouseX <= bottomRightCorner[0] ) && ( mouseY >= topLeftCorner[1] && mouseY <= bottomRightCorner[1] );
  }
  
  public String getID() {
    return identifier;
  }
  
}
