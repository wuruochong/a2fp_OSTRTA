public class Goblin extends Monster{

  
   public Goblin(){
     super();
     _hp = 100;
     _maxHP = 100;
     _mp = 25;
     _trainingTime = 30;
     _basicSpeed = 15;
     _attackRange = 5;
     _dmgPerAttack=11;
     _level = 1;
     _houseSpace = 1;
     _name = "Goblin";
     icon = loadImage("goblin.png");
   }
  public Goblin(int x, int y){
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