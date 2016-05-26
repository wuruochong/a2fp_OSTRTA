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
    background(255);
    fill(255);
    rect(170,150,300,400);
    fill(120);
    rect(170,150,60,30);
    fill(120);
    rect(170,180,60,30);
    fill(0);
    text(str(9), 200, 195);
    
    
    hImg = loadImage("home.jpg");
    image(hImg, 920, 370, 110, 110);
    
  }
}