public class Giant extends Monster{

   public Giant(){
     super();
     _hp = 999;
     _mp = 250;
     _trainingTime = 120;
      _basicSpeed = 2;
     _attackRange = 5;
     _dmgPerAttack=10;
     _level = 1;
     _houseSpace = 5;
   }

   public Giant(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}