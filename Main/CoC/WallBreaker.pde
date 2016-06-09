public class WallBreaker extends Monster{

   public WallBreaker (){
     super();
     _hp = 20;
     _mp = 1000;
     _trainingTime = 60;
     _basicSpeed = 25;
     _attackRange = 100;
     _dmgPerAttack=12;
     _level = 1;
     _houseSpace = 2;
   }
   
   public WallBreaker(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }


}
