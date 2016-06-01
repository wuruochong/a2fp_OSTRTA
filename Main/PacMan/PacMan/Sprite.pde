public class Sprite {

  int dir = 0; //0-right, 1-down, 2-left, 3-up
  int nextDir = 0; 
  float[] dirVal = {0, PI/2, PI, PI + PI/2};
  int xcor, ycor, xpos, ypos;

  public Sprite() {
    xcor = 0;
    ycor = 0;
  }

  public Sprite(int x, int y) {
  xcor = x;
  ycor = y;
  }

  public int getX() {return xcor;}

  public int getY() {return ycor;}

  public void setX(int x) { xcor = x; }

  public void setDir(int d) { nextDir = d; }

  void draw() {
  }

 

  void keyPressed() {
  }
}