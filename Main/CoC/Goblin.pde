public class Goblin {
  
  int _hp = 25;
  int _mp = 25;
  int _trainingTime = 30;
  int _moveSpeed = 32;
  double _attackRange = 0.4;
  int _dmgPerAttack=11;
  int _level = 1;
  int _houseSpace = 1;
  
   public Goblin(){
   
   }
   
  int attack(){
    return _dmgPerAttack;
  }
  
  int levelup(){
    _level++;
    return _level;
  }
  
}
