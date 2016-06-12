// represents a canon tower
/* Properties:
   - hits multiple at once
   - medium attack rate
   - low attack power
   - low crit chance
   - low range
   - can't attack air
   - medium hp
*/

public class Canon extends Defense {
    
  PImage icon;

    public Canon(int x, int y) {
	super(x, y); 
	_hp = 350;
  _maxHP = 350;
	_attackPower = 15;
	_critChance = .05;
	_range = 150;
	_splashRadius = 50;
	_attackAir = false;
	_attackRate = 30; // once per second
      icon = loadImage("canon.png");
        
        _mp = 200;
    }

    public void upgrade() {
	_attackPower = (int) (_attackPower * 1.1);
	_range = (int) (_range * 1.1);
	_hp = (int) (_hp * 1.1);
	_splashRadius = (int) (_splashRadius * 1.1);
	_upgradeState += 1;
    }
    
    void draw(){
      super.draw();
    //image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 50, 50);
    imageMode(CENTER);
    image(icon, _xcor, _ycor, 50, 50);
    imageMode(CORNER);
    fill(0);     
    }
    
    void draw(LList<Monster> monsterList) {
      super.draw(monsterList);
          imageMode(CENTER);
    image(icon, _xcor, _ycor, 50, 50);
    imageMode(CORNER);
 //   fill(0); 
  // text(_hp + " ", _xcor+70,  _ycor+40 ); 
      
      
      //rect(_xcor, _ycor, 10, 10);
    //println(_hp);
    //icon = loadImage("canon.png");
    //image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 50, 50); 

    }
    

}
	