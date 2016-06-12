
public class Wizard extends Monster{

   public Wizard(){
     super();
     _hp = 200;
     _maxHP = 200;
     _mp = 1500;
     _trainingTime = 300;
     _basicSpeed = 5;
     _attackRange = 5;
     _dmgPerAttack=100;
     _level = 1;
     _houseSpace = 4;
     _name = "Wizard";
    icon = loadImage("wizard.png");
}
   
   public Wizard(int x, int y){
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
