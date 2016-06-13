//import processing.sound.*;
//SoundFile file;
PImage cImg, hImg, wImg, caImg, camImg, CoCImg; //clock, home, wallpaper, calculator, camera

Clock clock;
Calendar calen;
Calculator calc;
CoC coc;

int state = 0; // 0 - VIEW, 1- CLOCK, 2- DAILY PLANNER, 3- CALCULATOR, 4 - COC

void setup() {
  size( 1280, 720);
  background(255);
  clock = new Clock();
  calc = new Calculator();
  coc = new CoC();
  
  //icon images
  wImg = loadImage("wall.jpg");
  cImg = loadImage("clock.png");
  hImg = loadImage("home.jpg");
  caImg = loadImage("calc.png");
  camImg = loadImage("cam.jpg");
  CoCImg = loadImage("CoC.jpg");
  reset();
}

void reset() {
  image(wImg, 35, 20, 910, 720);
  image(camImg, 15, 350, 40, 40);
  image(cImg, 450, 550, 70, 70);
  image(hImg, 920, 370, 110, 110);
  image(caImg, 560, 550, 70, 70);
  image(CoCImg, 670, 550, 70, 70);
}

void draw() {
  if (state == 1)
    {clock.draw();
   }
  else if (state == 4){

    coc.draw();


  }
  else if (state == 3) {
    calc.draw();
  }
    
  else if (state == 0) {
    background(255);
    reset();
      }
      fill(0);
  text(mouseX + " : " + mouseY, mouseX + 2, mouseY+2);
 
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
  if (state == 3) {
    calc.mousePressed();
  }
  if (state == 0) {
  if (mouseX >= 440 && mouseX <= 500 && mouseY >= 540 && mouseY <=600) {
    state = 1;
    //file.stop();
  }
  if (mouseX >= 660 && mouseX <= 720 && mouseY >= 540 && mouseY <=600) {
    state = 4;
  }
  if (mouseX >= 550 && mouseX <= 620 && mouseY >= 540 && mouseY <=610) {
    state = 3;
  }
  if (mouseX >= 950 && mouseX <=1000 && mouseY >= 400 && mouseY <= 440 ) {
    state = 0;
  }
  }
 
}
