public class Monster extends Unit{
  int  _hp;
  int _mp;
  int _xcor;
  int _ycor;
  
  int _trainingTime;
  int _moveSpeed;
  int _attackSpeed;
  int _attackRange;
  int _dmgPerAttack;
  
  public Monster(int xcor, int ycor){
    _xcor = xcor;
    _ycor = ycor;
    _hp = 10;
    _mp = 10;
  }
  int attack(){
    return 5;
  }
  void draw(){
    rect(_xcor*100, _ycor*100 , 10, 10);
  }
}
