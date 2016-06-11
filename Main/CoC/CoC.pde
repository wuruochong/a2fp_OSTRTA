PImage bImg;
PFont font;
Homebase base;
TestBase test;
int state; // 0 for normal, 1 for attacking, 2 for being attacked, 3 to choose tier
Button attackButton;
PImage tmp;
PImage tierChoice;
//int tier;

void setup(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0, 1280, 720);
  state = 0;
  base = new Homebase();
  //attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
  attackButton =new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
  //test = new TestBase(base._monstersOwned, base._gold);
  tierChoice = loadImage("tier.png");
}

void mousePressed() {
  
//println(mouseX + " " + mouseY);
   if (attackButton.buttonPressed(0)) {
     state = 3;
   }
    if (state == 3)
     {
       image(tierChoice, 0, 0, 1280, 760);
       
    if ( mouseX <= 420 && mouseY <= 380)
     {
       state = 1;
    test = new TestBase(base, 1);
   }
    else if ( mouseX> 420 && mouseX <= 850 && mouseY <= 380)
     {
       state = 1;
    test = new TestBase(base, 2);
   
   }
   
    else if ( mouseX >850 && mouseY <= 380)
     {  
    state = 1;
    test = new TestBase(base, 3);
      }
   
     }
  
   if ( state == 1 )
     test.mousePressed();
   if ( state == 0 )
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
  else if (state == 3) {
         image(tierChoice, 0, 0, 1280, 760);
  }
     //   fill(0);
    //text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
}
