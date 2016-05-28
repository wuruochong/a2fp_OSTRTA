import java.util.Stack; 

public class Calculator {
  String input;
  char[] opsRank = {'(', '^', '*', '/', '+', '-'};
  //Stack = new Stack();
  
  double getSqrt(double n) {
    return Math.sqrt(n);
  }
  
  double factorial(double n) {
    double retNum = n;
    n-=1;
    for (double i = n; n >=1; n--) 
      retNum*= i;
    return retNum;
  }
  
  
  void parseString(){
    
    
  }
  
  void draw() {
    
    int xpos, ypos, xsize, ysize;
    
    background(255);
    fill(255);
    rect(170,150,300,400);
    
    fill(120);
    rect(190,170,250,30);
    
    ypos = 200;
    
    for (int i = 7 ; i > 0 ; i -=3) { 
    xpos = 190;
    fill(120);
    ypos+=30;
    
    for (int j = i; j < i+3; j ++) {
    fill(120);
    rect(xpos,ypos,60,30);
    fill(0);
    text(str(j), xpos+10, ypos+25);
    xpos+=50;
    }
   }
    
    hImg = loadImage("home.jpg");
    image(hImg, 920, 370, 110, 110);
    
  }
}