import java.util.ArrayList; //for inventory?

public class Homebase{
  String _name;
  int _gold;
  int _elixir;
  ArrayList<Tower> _towersOwned;
  ArrayList<Monster> _monstersOwned;
  ArrayList<Button> _buttons;
  
 public Homebase() {
  _name = "default";
  _gold = 9999;
  _elixir = 9999;
  _towersOwned = new ArrayList<Tower>();
  _monstersOwned = new ArrayList<Monster>();
  _buttons = new ArrayList<Button>();
  _buttons.add( new Button(new int[] {200, 100}, new int[] {300,150}, "genText", "Click") );
  }
  
  public Homebase(String newName){
    this();
    _name = newName;
  }
  
  void draw() {
    //image(bImg,0,0);
    for ( Tower building : _towersOwned )
      building.draw();
    for ( Button button : _buttons )
      button.draw();
  }
  
  void mousePressed() {
    for ( Button button : _buttons ) {
      if ( button.buttonPressed() ) {
        String tag = button.getID();
        if ( tag.equals("genText") )
          text("hello, it's me", 500, 500);
      }
    }
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
        pay(mon.getCost());
        _monstersOwned.add(mon);
    return true;
    }
    return false;
  }
  
 public boolean upgradeTower(Tower t) {
   return true;
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