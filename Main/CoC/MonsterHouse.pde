public class MonsterHouse extends Tower{
  
  LList<Monster> _monstersOwned;
  int _capacity;
  int _residents;
  int size = 150;
  PImage icon;
  
  public MonsterHouse(int x, int y) {
    _hp = 500;
    _maxHP = 500;
    _xcor = x;
    _ycor = y;
    _residents = 0;
    _capacity = 100;
    _monstersOwned = new LList<Monster>();
  }
  
  void draw() {
      stroke(0);
      fill(255,255,255,0); 
      rect(_xcor, _ycor, size, size);
      // draw monsters
      for ( Monster m : _monstersOwned ) {
        m.drawRoaming(this);
      }
      
      //fill(0); 
      //text(_hp + " ", _xcor + 80,  _ycor + 80);
  }
  
  public LList<Monster> getMonsters() {
    return _monstersOwned;
  }
  
  // returns true if still enough space to add monsters
  // adds monsters to list also sets its _xcor _ycor to be within boundaries of wall
  public boolean addMonster(Monster monster) {
    if ( _residents < _capacity ) {
      // set initial position of monster inside housing unit
      int randX = (int) (Math.random() * size) + _xcor;
      int randY = (int) (Math.random() * size) + _ycor;
      monster._xcor = randX;
      monster._ycor = randY;
      
      _monstersOwned.add(monster);
      return true;
    }
    return false;
  }
  
  public void upgrade() {
    _capacity += 50;
  }
}
  