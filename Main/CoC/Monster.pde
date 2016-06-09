public class Monster extends Unit implements Comparable{

    boolean isFlying = false;
    int _trainingTime;
    double _xvelocity = 10;
    double _yvelocity = 10;
    int _basicSpeed = 10;
    int _sightRange;
    int _attackRange;
    int _dmgPerAttack;
    int _level;
    int _houseSpace;
    
    ArrayPriorityQueue _towersToShoot;
    
    double dir;
    
    int _drawTicks;

    public Monster() {
      this(0,0);
    }

  public Monster(int xcor, int ycor){
	  _xcor = xcor;
	  _ycor = ycor;
	  _hp = 10;
	  _mp = 10;
    _sightRange = 1000;
    _towersToShoot = new ArrayPriorityQueue<Tower>();
    _drawTicks = 0;
  }

    // if attacking is true, the monsters are in attack mode
    void draw(boolean attacking, ArrayList<Tower> towers){
      fill(0);
      text(_hp + "", _xcor, _ycor , 50, 50);
      if ( _drawTicks % 30 == 0) { // every half second...
        if ( attacking ) {
          face(); //orient x and y velocity to move to the nearest tower
          move();
          queueTowers(towers);
          shoot();
        }
      }
    }
    
    // calculate x and y velocity components to move in correction
    /*public void face() {
      if ( ! _towersToShoot.isEmpty() ) {
        Tower closestTower = (Tower) _towersToShoot.peekTop();
        double slope = ( _ycor - closestTower._ycor ) / ( _xcor - closestTower._xcor + 0.0 );
        _yvelocity = _xvelocity * slope;
        
        double scaleFactor = _basicSpeed / Math.hypot(_xvelocity, _yvelocity);
        _xvelocity *= scaleFactor;
        _yvelocity *= scaleFactor;
      }
      //println("hi");
    }*/
    
    public void face() {
      if ( ! _towersToShoot.isEmpty() ) {
        Tower closestTower = (Tower) _towersToShoot.peekTop();
       // println("X" + closestTower._xcor + "Y" + closestTower._ycor);
    double slope = ( closestTower._ycor - _ycor  ) / ( closestTower._xcor -  _xcor + 0.0 );
       
        dir = Math.atan(slope);
       //println(slope);
   
      }
    }
    public void move() {
      _xcor -= ((int) _xvelocity * Math.cos(dir));
      _ycor -= ((int) _yvelocity* Math.sin(dir));
      
      //_xvelocity = 1;
      //_yvelocity = 1;
    }
    
    
    // deals damage to tower
    public boolean attack(Tower tower) {
      return tower.takeDamage( _dmgPerAttack);
    }
    
  public int levelup(){
      _level++;  
      _dmgPerAttack = (int) (_dmgPerAttack*1.3) ;
      _hp = (int) (_hp * 1.3);
      _mp = (int) (_mp * 1.5);
      
      return _level;

    }
    
  public int getAttackRange() {
    return (int)_attackRange;
  }
  
  public int getCost() {
    return _mp;
  }

  // determines exactly how to shoot towers
    public void shoot() {
    	while ( ! _towersToShoot.isEmpty() && ! ((Tower)(_towersToShoot.peekTop())).isAlive() )
    	    _towersToShoot.removeTop();

      if (! _towersToShoot.isEmpty()){
    	Tower tower = (Tower)_towersToShoot.peekTop();
      if ( inAttackRadius(tower) )
    	  attack(tower); 
    println(tower._hp);
      }
     }

        // queues Towers into things to attack
    public void queueTowers(ArrayList<Tower> towerList) {
    	for ( Tower tower : towerList ) {
              
            if ( inSightRadius(tower) && !_towersToShoot.contains(tower )){ 
               _towersToShoot.add(tower);    	     }
    }       
      }

        // returns true if tower is in sight radius of the monster
        public boolean inSightRadius(Tower tower) {
    	    double dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
    	    return dist <= _sightRange;
        }
        
        // returns true if first tower in priority queue is within attack radius
        public boolean inAttackRadius(Tower tower) {
            double dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
            return dist <= _attackRange;          
        }
            
    public int compareTo(Object o){
      //if ( o instanceof Monster ) {
      //  Monster other = (Monster) o;
      //  return _hp - other._hp;
      //}
      return 0;
    }

}
