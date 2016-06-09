public class Archer extends Monster{

   public Archer(){
     super();
     _hp = 20;
     _mp = 50;
     _trainingTime = 25;
     _basicSpeed = 25;
     _attackRange = 200;
     _dmgPerAttack=7;
     _level = 1;
     _houseSpace = 1;

   }
   
   public Archer(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

   public int attack(){
     return 1;//shoot arrows implementation
   }


}
