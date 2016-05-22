public abstract class Unit{
  int _hp;
  int _mp;
  int _xcor;
  int _ycor;
  
  boolean isAlive(){
    return !(_hp == 0);
  }
  abstract int attack();
  abstract void draw();
}