public abstract class Unit{
  int _hp;
  int _xcor;
  int _ycor;

public boolean isAlive() {
  return _hp > 0;
}
abstract void draw();

abstract int getCost();

void setX(int x) {
  _xcor = x;
}

void setY(int y) {
  _ycor = y;
}

}
