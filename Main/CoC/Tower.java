public class Tower extends Unit{
  int  _hp;
  int _xcor;
  int _ycor;

   public Tower(int xcor, int ycor){
    _xcor = xcor;
    _ycor = ycor;
    _hp = 100;
  }

   public takeDamage(int n) {
   	  
  void draw(){
    rect(_xcor*100, _ycor*100 , 10, 10);
  }

}