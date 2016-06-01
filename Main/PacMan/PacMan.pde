Pac pac;
Board board;

void setup() {
  size(560,720);
  background(0);
  frameRate(15);
  pac = new Pac();
 // board = new Board("file name here");
}

void draw() {
  background(0);
 // board.drawBoard();
  //  pac.draw();
}


void keyPressed() {
  pac.keyPressed();
}