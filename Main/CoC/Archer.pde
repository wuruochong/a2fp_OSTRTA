public class Archer extends Monster{

   public Archer(){
     super();
     _hp = 100;
     _maxHP = 100;
     _mp = 50;
     _trainingTime = 25;
     _basicSpeed = 5;
     _attackRange = 50;
     _dmgPerAttack=7;
     _level = 1;
     _houseSpace = 1;
  _name = "Archer";
   }
   
   public Archer(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }


}