public class CoC{
 PImage   bImg;
PFont font;
Homebase base;
TestBase test;
int state; // 0 for normal, 1 for attacking, 2 for being attacked, 3 to choose tier
Button attackButton;
PImage tmp;
PImage tierChoice;
//int tier;
Selecter sel;

ArrayList<Button> _buttons;

public CoC(){
  size(1280,720);
  bImg = loadImage("grass.jpg");
  image(bImg,0,0, 1280, 720);
  state = 0;
  base = new Homebase();
  //attack  =new Button(new int[] {200, 100}, new int[] {300,150},"attack", "attack");
  attackButton =new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
  //test = new TestBase(base._monstersOwned, base._gold);
  tierChoice = loadImage("tier.png");
    _buttons = new ArrayList<Button>();
  //  public Button (int[] coor1, int[] coor2, String tag, String text, int screen, int[] rgbText, int[] rgbButton){
    //    _buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 100, 700}, m._name, m.getName() + "", 0));
  _buttons.add(new Button(new int[] {0, 100}, new int[]{425, 428}, "1", "", 3, new int[] {0,0,0}, new int[]{0,0,0}));
  _buttons.add(new Button(new int[] {426, 100}, new int[] {850, 428}, "2","", 3,new  int[] {0,0,0}, new int[]{0,0,0}));
  _buttons.add(new Button(new int[] {851, 100}, new int[] {1279,428}, "3", "", 3,new  int[] {0,0,0},new  int[]{0,0,0}));
  _buttons.add(new Button(new int[] {0, 431}, new int[] {425, 719}, "4", "", 3, new int[] {0,0,0}, new int[]{0,0,0}));
  _buttons.add(new Button(new int[] {426, 431}, new int[] {850, 719}, "5", "", 3, new int[] {0,0,0}, new int[]{0,0,0}));
  _buttons.add(new Button(new int[] {851, 431}, new int[] {1279, 719}, "6", "", 3,new int[] {0,0,0}, new int[]{0,0,0}));
}

void mousePressed() {
  
//println(mouseX + " " + mouseY);
   
    if (state == 3)
     {
       fill(255);
       rect(0,0, 1280, 100);
       fill(0);
       text("CHOOSE LEVEL OF DIFFICULTY", 550, 50);
       textSize(20);
       image(tierChoice, 100, 100, 1280, 660);
       
       for (Button b: _buttons) {
          if (b.buttonPressed(3)){
            int i = Integer.parseInt(b.identifier);
            state = 1;
            test = new TestBase(base, i);
          } 
       }
       
    textSize(12);
     }
  
   else if ( state == 1 )
     test.mousePressed();
     
   else if ( state == 0 ){
     if (attackButton.buttonPressed(0)) {
       if (base.state != 6){
         state = 4;
         sel = new Selecter(base);
       }
         
     }
      base.mousePressed();
   }
   
   else if (state == 4){
     sel.mousePressed();
   }
}

void loadImg(PImage holder, String s, int x, int y) {
holder = loadImage(s);
image(holder, x, y); 
}

void draw(){
  println(frameRate);
  if (state==0){
  image(bImg,0,0, 1280, 720);
    base.draw();
    if (base.state!=6){
      attackButton.img = loadImage("attack.jpg");
    }
    if (coc.base.state==6){
      attackButton.img = loadImage("attack2.png");
    }
    attackButton.draw();

  }
  else if (state == 1){
    if ( test.cont ) {
      test.draw();
    }
    if (!test.cont){
      state = 0;
      coc.base.state = 0;
    }
    // implement if button pushed to quit, make state == 0 
  }
  else if (state == 3) {
    
       fill(255);
       rect(0,0, 1280, 100);
              fill(0);
       text("CHOOSE LEVEL OF DIFFICULTY", 550, 50);
       textSize(20);
         image(tierChoice, 0, 100, 1280, 660);
  }
  else if (state == 4){
    if (sel.cont){
      sel.draw();
    }
    if (sel.back){
      state = 0;
    }
    if (!sel.cont){
      sel.baseUpdater(base);
      state = 3;
    }
  }
    //  fill(0);
  //  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
}
}
