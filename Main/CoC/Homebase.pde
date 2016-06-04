import java.util.ArrayList; //for inventory?

public class Homebase{
  String _name;
  int _gold;
  int _elixir;
  ArrayList<Tower> _towersOwned;
  ArrayList<Monster> _monstersOwned;
  ArrayList<Button> _buttons;
  PImage bImg;
  PImage shopImg;
  
  ArrayList<Tower> _towerChoices;
  ArrayList<Monster> _monsterChoices;
  
  int[] campFireLoc = {700, 700}; //random location
  
  int state; // 0 - viewing , 1 - shopping, 2- placing
  int[][] coords; // to store tower coordinates for showing range
  
  
 public Homebase() {
  _name = "default";
  _gold = 9999;
  _elixir = 9999;
  _towersOwned = new ArrayList<Tower>();
  _monstersOwned = new ArrayList<Monster>();
  _towerChoices = new ArrayList<Tower>();
  _monsterChoices = new ArrayList<Monster>();
  _towerChoices.add(new Defense(600, 350));
  _monsterChoices.add(new Barbarian());
  _buttons = new ArrayList<Button>();
  _buttons.add(new Button(new int[] {900, 600}, "shop", "shop.jpg"));
  _buttons.add( new Button(new int[] {200, 100}, new int[] {300,150}, "genText", "Click") );
  }
  
  public Homebase(String newName){
    this();
    _name = newName;
  }
  
  void draw() {
    if (state == 1) {
      rect(0, 0, 1280, 720);
      fill(210,180,140);;
      rect(0, 0, 1280, 100);
      fill(255);
      text( "SHOP", 600, 50);
      fill(255, 0, 0);
      rect(1100, 40, 40, 40);
      fill(255);
    }
    else if (state == 0) {
      
      //to reset
      bImg = loadImage("grass.jpg");
      image(bImg,0,0);
      
      //draw tower if alive, remove from array if not
      for ( Tower building : _towersOwned ) {
        if (building.isAlive())
        {
          //to show range, paint green box under tower
          if (building._show)
            {
              fill(0, 255, 0);
              rect(coords[0][0], coords[0][1], coords[1][0] - coords[0][0], coords[1][1] - coords[0][1]);
            }
          building.draw();
        }
        else 
          _towersOwned.remove(building);
      }
      //draw monster if alive, remove from array if not
      for ( Monster m : _monstersOwned ) {
        if (m.isAlive())
          m.draw();
        else 
          _monstersOwned.remove(m);
      }
      for ( Button button : _buttons )
        button.draw();
      }
    }
  
  void mousePressed() { 
    
    // if clicked on a button
    
    for ( Button button : _buttons ) {
      if ( button.buttonPressed() ) {
        String tag = button.getID();
        
        if ( tag.equals("genText") )
          text("hello, it's me", 500, 500);
          
        //clicked on shop icon
        if (tag.equals("shop") )
          {
            state = 1;
          }
        }
    }
    
    //if clicked on a tower
    for (Tower t : _towersOwned) {
        if (mousePressed && (mouseX - 50) >= t._xcor 
        && (mouseX + 50) <= t._xcor 
        && (mouseY - 50) >= t._ycor 
        && (mouseY + 50) <= t._ycor
        && t._show == false ) {
          t._show = true;
          coords = t.showRange();
        }
        
          if (t._show == true)
          t._show = false;
    }
    
    //exit to homebase
    if (state == 1 && 
        mouseX>= 1100 && 
        mouseX <= 1140 &&
        mouseY >= 40 &&
        mouseY <= 80) {
        state = 0;
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
    
  public void payGold(int payment) {
      _gold -= payment; 
  }
  
  public void payElixir(int e) {
    _elixir -= e;
  }
  
  public boolean buyTower(Tower property) {
    if (_gold >= property.getCost()) {
          payGold(property.getCost());
          placeItem(property);
          _towersOwned.add(property);
          return true;
      }
    return false;
  }
  
  //buy AND genmerate monsters, walk them to their place
  public boolean buyMonster(Monster mon) {
      if (_elixir >= mon.getCost()){
        payElixir(mon.getCost());
        _monstersOwned.add(mon);
        
        //walk monster to campfire location
        //walking x coordinate
        while  (mon._xcor != campFireLoc[0]) {
          if (mon._xcor < campFireLoc[0])
            mon._xcor++;
          else
            mon._xcor--;
        }
        //walking y coordinate
        while (mon._ycor != campFireLoc[1]) {
          if (mon._ycor < campFireLoc[0])
            mon._ycor++;
          else
            mon._ycor--;
        }
    return true;
    }
    return false;
  }
  
 public boolean upgradeTower(Tower t) {
   return true;
 }
 
  
  void placeItem(Tower p) {
    if (mousePressed && (mouseX - 50) >= p._xcor 
        && (mouseX + 50) <= p._xcor 
        && (mouseY - 50) >= p._ycor 
        && (mouseY + 50) <= p._ycor ) {
      if (!mousePressed) 
        p.setCoor(mouseX, mouseY);
  }
 }
  
}
