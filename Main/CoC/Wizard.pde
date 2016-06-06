public class Wizard extends Monster{

   public Wizard(){
     super();
     _hp = 75;
     _mp = 1500;
     _trainingTime = 300;
     _basicSpeed = 15;
     _attackRange = 3;
     _dmgPerAttack=75;
     _level = 1;
     _houseSpace = 4;
   }
   
   public Wizard(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }


}