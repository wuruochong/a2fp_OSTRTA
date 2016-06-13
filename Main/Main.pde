import java.util.ArrayList;

PImage cImg, hImg, wImg, caImg, camImg, CoCImg; //clock, home, wallpaper, calculator, camera

ArrayList<Button> buttons;

Clock clock;
Calendar calen;
Calculator calc;
CoC coc;
Planner plan;
Button home;

int state = 0; // 0 - VIEW, 1- CLOCK, 2- DAILY PLANNER, state 3 does not exist, 4 - COC
int alarmDisplayTimer = 0;
boolean alarmRinging;

void setup() {
  size( 1280, 720);
  background(255);
  clock = new Clock();
  calc = new Calculator();
  coc = new CoC();
  plan = new Planner();
  
  alarmRinging = false;
  //icon images
  wImg = loadImage("wall.jpg");
  //cImg = loadImage("clock.png");
  //hImg = loadImage("home.jpg");
  //caImg = loadImage("calc.png");
  camImg = loadImage("cam.jpg");
  //CoCImg = loadImage("CoC.jpg");
  
  // load buttons
  buttons = new ArrayList<Button>();
 // buttons.add(new Button(new int[] {950, 400}, "home", 0, "home.jpg"));
  buttons.add(new Button(new int[] {440, 540}, "clock", 0, "clock.png"));
  buttons.add(new Button(new int[] {330,540}, "planner",0,"plan.png"));
  // place planner button here
  buttons.add(new Button(new int[]  {550, 540}, "game", 0, "CoC.jpg")); 
  home = (new Button(new int[] {1200, 400}, "home", 0, "home.jpg"));
  reset();
}

void reset() {
  image(wImg, 35, 20, 910, 720);
  image(camImg, 15, 350, 40, 40);
  //image(cImg, 450, 550, 70, 70);
  //image(hImg, 920, 370, 110, 110);
  //image(caImg, 560, 550, 70, 70);
  //image(CoCImg, 670, 550, 70, 70);
  for ( Button b : buttons )
    b.draw();
}

void draw() {
  //println( alarmRinging );
  if ( ! clock.alarm.isEmpty() && ! alarmRinging
       && hour() == ((Time)clock.alarm.peekTop()).hour
       && minute() == ((Time)clock.alarm.peekTop()).min ) {
         println("hi");
         alarmRinging = true;
         clock.alarm.removeTop();
       }
   // ring alarm
   //alarmRinging = true;
  if ( alarmRinging ) {
    println("lolz");
    fill(255,0,0);
    rect(640, 300, 200, 200);
    textAlign(CENTER);
    fill(0);
    text("ALARM", 740, 400);
    textAlign(CORNER);
    
    if ( alarmDisplayTimer > 500 ) {
      alarmRinging = false;
      alarmDisplayTimer = 0;
    }
    else
      alarmDisplayTimer += 1;
  }
  
  if (state == 1) {
    clock.draw();
   }
  else if (state == 4){
   coc.draw();
  }

  else if (state == 2){
    plan.draw();
  }
    
  else if (state == 0) {
    background(255);
    reset();
  }
  fill(0);
//  text(mouseX + " : " + mouseY, mouseX + 2, mouseY+2);
   home.draw();
}

void mouseReleased()
{
 if (state == 4) {
     coc.base.mouseReleased();
 } 
}



void mousePressed() {
  if (state == 1){
     clock.mousePressed();
  }
  if (state == 4) {
      coc.mousePressed();
  }
  if (state == 2){
    plan.mousePressed();
  }
  //if (state == 3) {
  //  calc.mousePressed();
  //}
  if (state == 0) {
    for ( Button button : buttons ) {
      if ( button.buttonPressed(0) ) {
        String tag = button.getID();
        
    //    if ( tag.equals("home") )
      //    state = 0;
         if ( tag.equals("clock") )
          state = 1;
        else if ( tag.equals("planner") )
          state = 2;
        else if ( tag.equals("game") )
          state = 4;
      }
    }
  }
  if (home.buttonPressed(0)){
    state = 0;
  }
    /*
    if (mouseX >= 440 && mouseX <= 500 && mouseY >= 540 && mouseY <=600) {
      state = 1;
      //file.stop();
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 540 && mouseY <=600) {
      state = 4;
    } 
    if (mouseX >= 550 && mouseX <= 620 && mouseY >= 540 && mouseY <=610) {
      state = 4;
    }
    if (mouseX >= 950 && mouseX <=1000 && mouseY >= 400 && mouseY <= 440 ) {
      state = 0;
    } */
}
 