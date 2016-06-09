public class Giant extends Monster{

   public Giant(){
     super();
     _hp = 300;
     _mp = 250;
     _trainingTime = 120;
      _basicSpeed = 12;
     _attackRange = 100;
     _dmgPerAttack=22;
     _level = 1;
     _houseSpace = 5;
   }

   public Giant(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}
