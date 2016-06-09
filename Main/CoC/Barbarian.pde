public class Barbarian extends Monster{


   public Barbarian(){
     super();
     _hp = 999;
     _mp = 25;
     _trainingTime = 30;
      _basicSpeed = 5;
     _attackRange = 5;
     _dmgPerAttack=900;
     _level = 1;
     _houseSpace = 1;
   }
   
   public Barbarian(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}