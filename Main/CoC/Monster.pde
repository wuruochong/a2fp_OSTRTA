public class Monster extends Unit implements Comparable{

    boolean isFlying = false;
    int _trainingTime;
    double _xvelocity;
    double _yvelocity;
    int _basicSpeed;
    int _attackRange;
    int _dmgPerAttack = 10;
    int _level;
    int _houseSpace;
    
    Tower _tmpTower;
    Tower _target;
    double dir;
    int _drawTicks;
  String _name;
  
    public Monster() {
      this(0,0);
    }

  public Monster(int xcor, int ycor){
	  _xcor = xcor;
	  _ycor = ycor;
	  _hp = 10;
	  _mp = 10;
    _drawTicks = 0;    
    _name = "mon";
  }

  String getName() {return _name;}
  
    // if attacking is true, the monsters are in attack mode
    void drawAttack(boolean attacking, LList<Tower> towers){
      //println(towers);
      fill(0);
      text(_hp + "", _xcor, _ycor , 50, 50);
      if ( attacking ) {
        getTarget(towers);
        if ( ! _target.isAlive() ) {
          towers.remove(_target);
          getTarget(towers);
        }
        face();
        move();
      }
      if ( attacking && _drawTicks % 5 == 0) { // every half second...
        shoot();
      }
      _drawTicks += 1;
    }

    public void face() {
    /*  if ( ! _towersToShoot.isEmpty() ) { 
        Tower closestTower = (Tower) _target;
       // println("X" + closestTower._xcor + "Y" + closestTower._ycor); */
      double slope = ( _target._ycor - _ycor  ) / ( _target._xcor -  _xcor + 0.0 );
        //dir = Math.atan(slope);
        dir = Math.atan2( _target._ycor - _ycor ,  _target._xcor - _xcor );

    }
    
    public void move() {
      if ( inAttackRadius(_target) ) {
      return;
    }
      double xvel =  _basicSpeed * Math.cos(dir);
      double yvel = _basicSpeed * Math.sin(dir);
  
   //   if ( xvel > 0 )
     //   xvel *= -1;
      //if ( yvel > 0 )
       // yvel *= -1;

      _xcor += xvel;
      _ycor += yvel;
      
      //_xvelocity = 1;
      //_yvelocity = 1;
    }
    
    
    // deals damage to tower
    public boolean attack(Tower tower) {
      return tower.takeDamage( _dmgPerAttack );
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

  public void setTower(Tower t) {
    _tmpTower = t;
  }
  
  // determines exactly how to shoot towers
    public void shoot() {
  /*  	while ( ! _towersToShoot.isEmpty() && ! ((Tower)(_towersToShoot.peekTop())).isAlive() )
    	    _towersToShoot.removeTop();

      if (! _towersToShoot.isEmpty()){
    	Tower tower = (Tower)_towersToShoot.peekTop(); */

      if ( inAttackRadius(_target) ) {
    	  attack(_target); 
   // println(_target._hp);
      }
   //  println(_target._hp);
      }

    //gets closest tower
    public void getTarget(LList<Tower> towerList) {
      double sDist = Double.MAX_VALUE;
      for ( Tower tower : towerList ) {
        double tmp = Math.hypot(tower._xcor - this._xcor, tower._ycor - this._ycor);
        if ( tmp < sDist ) {
          sDist = tmp;
          _target = tower;
        
        }
        
        }
      }
        // returns true if tower is in sight radius of the monster
    /*    public boolean inSightRadius(Tower tower) {
    	    double dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
    	    return dist <= _sightRange;
        }
        */
        
        // returns true if first tower in priority queue is within attack radius
        public boolean inAttackRadius(Tower tower) {
            double dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
 //           println(dist);
            return dist <= _attackRange;          
        }
            
    public int compareTo(Object o){
      double dist =  Math.hypot((_tmpTower._xcor - this._xcor),(_tmpTower._ycor - this._ycor));
      double distO = Math.hypot(_tmpTower._xcor - ((Monster)o)._xcor, _tmpTower._ycor - ((Monster)o)._ycor);
      return (int)(dist - distO);
      //if ( o instanceof Monster ) {
      //  Monster other = (Monster) o;
      //  return _hp - other._hp;
      //}
    }

}
