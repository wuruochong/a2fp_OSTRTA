public abstract class Unit{
  int _hp;
  int _maxHP;
  int _xcor;
  int _ycor;
  int _mp;

public boolean isAlive() {
  return _hp > 0;
}

int getCost(){
     return _mp;
   }

   void setCoor(int x, int y) {
   _xcor = x;
   _ycor = y;
 }

 boolean takeDamage(int n) {
  _hp -= n;
  return isAlive();
    }
    
}