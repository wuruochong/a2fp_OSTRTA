// represents any building in the game
public abstract class Tower extends Unit {
    int _upgradeState;
    int _range;
    boolean _show; //show range
    Monster _tmpMonster;
    int _id;
    boolean clicked;
    
   /*
    // decreases tower hp by n
    // returns true if tower is destroyed as a result of this damage
    public boolean takeDamage(int n) {
	      _hp -= n;
        println(_hp);
	      return isAlive();
    } */

    // returns true if tower successfully upgraded
    public abstract void upgrade();

    void draw(){
	rect(_xcor*100, _ycor*100 , 10, 10);
    }
    
    void draw(int xcor, int ycor) {
      rect(xcor * 100, ycor * 100, 10, 10);
    }
    
    /*
    public int compareTo(Object o){
      double dist1 = Math.hypot( _tmpMonster._xcor - this._xcor, _tmpMonster._ycor - this._ycor );
      double dist2 = Math.hypot( _tmpMonster._xcor - ((Tower) o)._xcor, _tmpMonster._ycor - ((Tower) o)._ycor);
      return (int)(dist1 - dist2);
    }
    */
    
    public boolean isAlive() {
      return _hp > 0;
  }
  
   public void setMonster(Monster m) {
     _tmpMonster = m;
   }
   
   public void setHP(int n){
     _hp = n;
   }
   
   void setCoor(int x, int y) {
   _xcor = x;
   _ycor = y;
 }
 
 
}