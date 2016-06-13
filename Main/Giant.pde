public class Giant extends Monster{
    
  
   public Giant(){
     super();
     _hp = 500;
     _maxHP = 500;
     _mp = 250;
     _trainingTime = 120;
      _basicSpeed = 2;
     _attackRange = 5;
     _dmgPerAttack=10;
     _level = 1;
     _houseSpace = 5;
     _name = "Giant";
    icon = loadImage("giant.png");
   }

   public Giant(int x, int y){
     this();
     _xcor = x;
     _ycor = y;
   }
   
      
    void drawAttack(boolean attacking, LList<Tower> towers){
      super.drawAttack(attacking, towers);
    imageMode(CENTER);
    image(icon, _xcor, _ycor, 25, 25);
    imageMode(CORNER);
     }
    
     void drawRoaming(MonsterHouse house){
      super.drawRoaming(house);
    imageMode(CENTER);
    image(icon, _xcor, _ycor, 25, 25);
    imageMode(CORNER);
    }


}