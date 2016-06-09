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
  image(bImg,0,0, 1280, 720);
  state = 0;
  base = new Homebase();
  //attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
  attack=new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
  //test = new TestBase(base._monstersOwned, base._gold);
}

void mousePressed() {
  
//println(mouseX + " " + mouseY);
   if (attack.buttonPressed(0))
     state = 1;
     
   else if ( state == 0 )
    base.mousePressed();
}

void loadImg(PImage holder, String s, int x, int y) {
holder = loadImage(s);
image(holder, x, y); 
}

void draw(){
  if (state==0){
  image(bImg,0,0, 1280, 720);
    base.draw();
    attack.draw();
  }
  else if (state == 1){
    test = new TestBase(base);
    test.draw();
    // implement if button pushed to quit, make state == 0 
  }
}