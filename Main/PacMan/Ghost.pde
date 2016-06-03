public class Ghost extends Sprite{
  
  int skinColor;
  boolean alive;
  boolean scared;
  
  public Ghost() {
    xcor = 0;
    ycor = 0;
  }

  public Ghost(int x, int y, int c) {
  xcor = x;
  ycor = y;
  skinColor = c;
  }

 void reset() {
   xcor = 0; 
   ycor = 0;
   alive = true;
   scared = false;
 }
 
 

  void draw() {
    drawSprite();
  }

  public void drawSprite() {  
   /* color eyes = color(40, 80, 251);
    color skin = skinColor;
    color mouth = skinColor;
    
    if (scared) {
      skin = color(40, 80, 251);
      mouth = color (255);
      eyes = color(255, 255, 255);
    }*/
    
    fill(skinColor);
    rect((xcor*20+xpos*5)-12.5, (ycor*20+ypos*5+60)-1, 25, 9);
    arc((xcor*20+xpos*5), (ycor*20+ypos*5+60), 25, 25, PI, 2 * PI);

  }


  void keyPressed() {
 }
}