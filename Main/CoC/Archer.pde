public class Archer extends Monster{

   public Archer(){

     _hp = 20;
     _mp = 50;
     _trainingTime = 25;
     _moveSpeed = 24;
     _attackRange = 3.5;
     _dmgPerAttack=7;
     _level = 1;
     _houseSpace = 1;

   }

   public int attack(){
     return 1;//shoot arrows implementation
   }


}