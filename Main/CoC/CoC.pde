
PImage bImg;
PFont font;
Homebase base;
TestBase test;
int state; // 0 for normal, 1 for attacking, 2 for being attacked
Button attack;

void setup(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0);
  state = 0;
  base = new Homebase();
  attack  =new Button(new int[] {900, 1000}, new int[] {500,600},"attack", "attack");
}

void mousePressed() {
   if (attack.buttonPressed()){
     state = 1;
   }
   else if ( state == 0 )
    base.mousePressed();
}

void draw(){
  image(bImg,0,0);
    base.draw();
   // test = new TestBase(base._monstersOwned, base._gold);
    
  /*if (state == 1){
    test.draw();
  }*/
    
  /*
  for (Unit[] x : grid){
    for (Unit y : x){
      if (y!=null){
        y.draw();
      }
    }
  } */
}