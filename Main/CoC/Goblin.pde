public class Goblin extends Monster{


   public Goblin(){
     super();
     _hp = 999;
     _mp = 25;
     _trainingTime = 30;
     _basicSpeed = 15;
     _attackRange = 5;
     _dmgPerAttack=11;
     _level = 1;
     _houseSpace = 1;
     _name = "Goblin";

   }
  public Goblin(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}
