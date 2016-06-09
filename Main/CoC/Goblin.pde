public class Goblin extends Monster{


   public Goblin(){
     super();
     _hp = 25;
     _mp = 25;
     _trainingTime = 30;
     _basicSpeed = 32;
     _attackRange = 50;
     _dmgPerAttack=11;
     _level = 1;
     _houseSpace = 1;

   }
  public Goblin(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}
