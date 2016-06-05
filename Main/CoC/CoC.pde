
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
  attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
  test = new TestBase(base._monstersOwned, base._gold);
}

void mousePressed() {
   if (attack.buttonPressed()){
     state = 1;
   }
   else if ( state == 0 )
    base.mousePressed();
}

void draw(){

  if (state==0){
  image(bImg,0,0);
    base.draw();
      attack.draw();
  }
    
    
  if (state == 1){
    test.draw();
    if (!test.cont){
      state = 0;
    }
  }
    
  /*
  for (Unit[] x : grid){
    for (Unit y : x){
      if (y!=null){
        y.draw();
      }
    }
  } */
}