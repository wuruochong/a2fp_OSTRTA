public class Pac extends Sprite{

  public Pac() {
    xcor = 0;
    ycor = 0;
  }

  public Pac(int x, int y) {
  xcor = x;
  ycor = y;
  }

  void draw() {
    drawSprite();
  }

  public void drawSprite() {
    color yellow = color(255, 255, 0);
    fill(yellow);
    }


  void keyPressed() {
    if (key == 'd') {
      setDir(0);
    } else if (key == 's') {
      setDir(1);
    } else if (key == 'a') {
      setDir(2);
    } else if (key == 'w') {
      setDir(3);
    }
  }
}