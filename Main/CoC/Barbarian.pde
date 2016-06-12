public class Barbarian extends Monster{


   public Barbarian(){
     super();
     _hp = 100;
     _maxHP = 100;
     _mp = 25;
     _trainingTime = 30;
      _basicSpeed = 5;
     _attackRange = 5;
     _dmgPerAttack=10;
     _level = 1;
     _houseSpace = 1;
     _name = "Barbarian";
   }
   
   public Barbarian(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}