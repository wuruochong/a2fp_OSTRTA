public class Monster extends Unit implements Comparable{
    int  _hp;
    int _mp;
    int _xcor;
    int _ycor;
    
    int _trainingTime;
    int _moveSpeed;
    int _attackSpeed;
    int _attackRange;
    int _dmgPerAttack;
    
    public Monster(int xcor, int ycor){
	_xcor = xcor;
	_ycor = ycor;
	_hp = 10;
	_mp = 10;
    }
    
    // reduces HP by n, returns true if monster is now dead
    public boolean takeDamage(int n) {
	_hp -= n;
	return ! isAlive();
    }

    int attack(){
	return 5;
    }
    
    void draw(){
	rect(_xcor*100, _ycor*100 , 10, 10);
    }
}
