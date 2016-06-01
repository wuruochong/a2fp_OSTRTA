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
    walk();
  }

  void drawSprite() {
    color yellow = color(255, 255, 0);
    fill(yellow);
     arc(xcor*20 + xcor*5, ycor*20 + ypos*5 + 60, 25, 25, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76) );
      // mouth movement //
     }
   
   void walk() { //0-right, 1-down, 2-left, 3-up
   if (board.isWall(xcor, ycor)) {
     if (nextDir == 0) xcor++;
     if (nextDir == 1) ycor--;
     if (nextDir==2) xcor--;
     if (nextDir==3) ycor++;
   }
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
    
    println(key);
    
  }
}
