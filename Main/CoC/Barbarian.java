public class Barbarian {
  
  int _hp = 45;
  int _mp = 25;
  int _trainingTime = 20;
  int _moveSpeed = 16;
  double _attackRange = 0.4;
  int _dmgPerAttack=8;
  int _level = 1;
  int _houseSpace = 1;
  
   public Barbarian(){
   
   }
   
  int attack(){
    return _dmgPerAttack;
  }
  
  int levelup(){
    _level++;
    return _level;
  }
  
}
