public class Barbarian extends Monster{
    
   public Barbarian(){
     super();
     _hp = 100;
     _maxHP = 100;
     _mp = 25;
     _trainingTime = 30;
      _basicSpeed = 5;
     _attackRange = 5;
     _dmgPerAttack=10;
     _level = 1;
     _houseSpace = 1;
     icon = loadImage("barb.png");
     _name = "Barbarian";
   }
   
   public Barbarian(int x, int y){
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