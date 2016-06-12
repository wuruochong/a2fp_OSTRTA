public class Bullet{

PImage bullet;
int _xcor;
int _ycor;
double dir;
Monster target;
boolean _hit;

public Bullet(int x, int y, Monster tar) {
    _xcor = x;
    _ycor = y;
    //dir = d;
    bullet = loadImage("ball.png");
  target = tar;
}

void move() {
    dir = Math.atan2( target._ycor - _ycor ,  target._xcor - _xcor );
    double xvel =  100 * Math.cos(dir);
    double yvel = 100 * Math.sin(dir);
    //println(xvel + " " + yvel); 
    _xcor += xvel;
    _ycor += yvel;
      
    }

    



void display() {
  fill(0);
  ellipse(_xcor, _ycor, 10, 20);
  move();
  //println(_xcor + " " + _ycor);
}

}
