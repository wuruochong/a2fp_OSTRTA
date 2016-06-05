PImage bImg;
PFont font;
Homebase base;
TestBase test;
int state; // 0 for normal, 1 for attacking, 2 for being attacked
Button attack;
PImage tmp;



void setup(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0);
  state = 0;
  base = new Homebase();
  //attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
   attack=new Button(new int[] {0, 600}, "attack", "attack.jpg");
  test = new TestBase(base._monstersOwned, base._gold);
}

void mousePressed() {
   if (attack.buttonPressed()){
     state = 1;
   }
   
   if (state == 1) {
     //Needs implementation>
     //check for click on monsters available in squares
     //if clicked on monster, release it to AI base
     // monster move and attack
   
   }
   
   
   else if ( state == 0 )
    base.mousePressed();
}

void loadImg(PImage holder, String s, int x, int y) {
holder = loadImage(s);
image(holder, x, y); 
}

void draw(){

  if (state==0){
  image(bImg,0,0);
    base.draw();
      attack.draw();
  }
    
  
    if (state == 1){
    test.draw();
    
    
    
    
    /*
    //how to make it generate the rest?
for (int i = 0; i < 9- panelsUsed; i ++ ){
      tmp = loadImage("square.png");
      image(tmp, tmpX, 600);
      tmpX += 50;
      } */
    
    
  //  if (!test.cont){
   //   state = 0;
   // }
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