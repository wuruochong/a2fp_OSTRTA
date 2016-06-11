
public class Wizard extends Monster{

   public Wizard(){
     super();
     _hp = 999;
     _mp = 1500;
     _trainingTime = 300;
     _basicSpeed = 5;
     _attackRange = 5;
     _dmgPerAttack=100;
     _level = 1;
     _houseSpace = 4;
     _name = "Wizard";
   }
   
   public Wizard(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }
}