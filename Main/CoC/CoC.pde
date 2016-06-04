
PImage bImg;
PFont font;
Homebase base;
int state; // 0 for normal, 1 for attacking, 2 for being attacked

void setup(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0);
  state = 0;
  base = new Homebase();
  
}

void mousePressed() {
  if ( state == 0 )
    base.mousePressed();
}

void draw(){
  //image(bImg,0,0);
  base.draw();
  /*
  for (Unit[] x : grid){
    for (Unit y : x){
      if (y!=null){
        y.draw();
      }
    }
  } */
}