public class Archer {
  
  int _hp = 20;
  int _mp = 50;
  int _trainingTime = 25;
  int _moveSpeed = 24;
  double _attackRange = 3.5;
  int _dmgPerAttack=7;
  int _level = 1;
  int _houseSpace = 1;
  
   public Archer(){
   
   }
   
  int attack(){
    return _dmgPerAttack;
  }
  
  int levelup(){
    _level++;
    return _level;
  }
  
}
