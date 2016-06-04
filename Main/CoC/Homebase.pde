import java.util.ArrayList; //for inventory?

public class Player{
  String _name;
  int _gold;
  int _elixir;
  ArrayList<Tower> _towersOwned;
  ArrayList<Monster> _monstersOwned;
    
  
 public Player() {
  _gold = 9999;
  _elixir = 9999;
  _towersOwned = new ArrayList<Tower>();
  _monstersOwned = new ArrayList<Monster>();
  }
  
  public Player(String newName){
    this();
    _name = newName;
  }
  
  public String getName(){
    return _name;
    }
    
  public int getGold(){
    return _gold;
    }
    
  public int getElixir(){
    return _elixir;
    }
    
  public void pay(int payment) {
      _gold -= payment; 
  }
  
  public boolean buyTower(Tower property) {
    if (_gold >= property.getCost()) {
          pay(property.getCost());
          placeItem(property);
          _towersOwned.add(property);
          return true;
      }
    return false;
  }
  
  public boolean buyMonster(Monster mon) {
      if (_gold >= mon.getCost()){
        pay(property.getCost());
        _monstersOwned.add(mon);
    return true;
    }
    return false;
  }
  
 public boolean upgradeTower(Tower t) {
   
 }
  
  void placeItem(Unit p) {
    while (!mousePressed) {
    if (mousePressed) {
    p.setX(mouseX);
    p.setY(mouseY);
  }
  }
  }
  
}
