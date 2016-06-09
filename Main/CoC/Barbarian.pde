public class Barbarian extends Monster{


   public Barbarian(){
     super();
     _hp = 25;
     _mp = 25;
     _trainingTime = 30;
      _basicSpeed = 100;
     _attackRange = 150;
     _dmgPerAttack=11;
     _level = 1;
     _houseSpace = 1;
   }
   
   public Barbarian(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }

}
