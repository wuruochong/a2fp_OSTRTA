// represents a button
public class Button {
  int[] topLeftCorner;
  int[] bottomRightCorner;
  String identifier;
  String displayText;
  int[] textColor;
  int[] buttonColor;
  
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
  
  void draw() {
    fill(buttonColor[0], buttonColor[1], buttonColor[2]);
    rect(topLeftCorner[0], topLeftCorner[1], bottomRightCorner[0] - topLeftCorner[0], bottomRightCorner[1] - topLeftCorner[1]);
    
    fill(textColor[0], textColor[1], textColor[2]);
    text(displayText, (int ) (topLeftCorner[0] * 1.25), (int) (topLeftCorner[1] * 1.25));
  }
  
  public boolean buttonPressed() {
    return ( mouseX >= topLeftCorner[0] && mouseX <= bottomRightCorner[0] ) && ( mouseY >= topLeftCorner[1] && mouseY <= bottomRightCorner[1] );
  }
  
  public String getID() {
    return identifier;
  }
  
}