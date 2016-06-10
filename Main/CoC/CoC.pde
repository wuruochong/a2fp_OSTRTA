PImage bImg;
PFont font;
Homebase base;
TestBase test;
int state; // 0 for normal, 1 for attacking, 2 for being attacked
Button attackButton;
PImage tmp;



void setup(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0, 1280, 720);
  state = 0;
  base = new Homebase();
  //attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
  attackButton =new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
  //test = new TestBase(base._monstersOwned, base._gold);
  test = new TestBase(base);
}

void mousePressed() {
  
//println(mouseX + " " + mouseY);
   if (attackButton.buttonPressed(0))
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
    attackButton.draw();
  }
  else if (state == 1){
    if ( test.cont ) {
      test.draw();
    }
    if (!test.cont){
      state = 0;
    }
    // implement if button pushed to quit, make state == 0 
  }
}