Pac pac;
Board board;
Ghost red;

void setup() {
  size(560,720);
  background(0);
  frameRate(2.5);
  pac = new Pac();
  red = new Ghost();  
 // board = new Board("file name here");
}

void draw() {
  background(0);
 // board.drawBoard();
   pac.draw();
   red.draw();
}


void keyPressed() {
  pac.keyPressed();
}