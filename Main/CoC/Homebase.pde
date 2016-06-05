import java.util.ArrayList; //for inventory?
import java.util.Stack; //to store actions

public class Homebase{
  String _name;
  int _gold;
  int _elixir;
  ArrayList<Tower> _towersOwned;
  ArrayList<Monster> _monstersOwned;
  ArrayList<Button> _buttons;
  PImage bImg;
  PImage shopImg;
  PImage resources;
  
  boolean showResources; //for shop
  
  //choices of towers and monsters that can be beought from the shop at level
  ArrayList<Tower> _towerChoices;
  ArrayList<Monster> _monsterChoices;
  
  int[] campFireLoc = {700, 700}; //random location
  
  int state; // 0 - viewing , 1 - shopping, 2- placing
  int[][] coords; // to store tower coordinates for showing range
  
  
 public Homebase() {
   //attributes 
  _name = "default";
  _gold = 9999;
  _elixir = 9999;
  
  _towersOwned = new ArrayList<Tower>();
  _monstersOwned = new ArrayList<Monster>();
  
  //default items owned
  _towersOwned.add(new Canon(500, 300));
  _towersOwned.add(new TownHall(600, 450));
  _towersOwned.add(new GoldMine(300, 200));
  
  _towerChoices = new ArrayList<Tower>();
  _monsterChoices = new ArrayList<Monster>();
  
  _towerChoices.add(new Defense(600, 350));
  _monsterChoices.add(new Barbarian());
  
  _buttons = new ArrayList<Button>();
  _buttons.add(new Button(new int[] {900, 600}, "shop", "shop.jpg"));
//  _buttons.add( new Button(new int[] {200, 100}, new int[] {300,150}, "genText", "Click") );
  
   Stack actions = new Stack();
}
  
  public Homebase(String newName){
    this();
    _name = newName;
  }
  
  void draw() {
    
    //SHOP MODE
    if (state == 1) { 
    
      shopImg = loadImage("shop.png");
      image(shopImg, 0, 0, 1280, 720);
      text("Gold: " + _gold, 50, 50);
      text("Elixers: " + _elixir, 50, 70);
      
      if (showResources) {
       resources = loadImage("resources.jpg");
       image(resources, 0, 0, 1280, 720);
      }
    }
    
    //VIEW MODE
    else if (state == 0) {
      
      //to reset
      bImg = loadImage("grass.jpg");
      image(bImg,0,0, 1280, 720);
      
      //draw tower if alive, remove from array if not
      for ( Tower building : _towersOwned ) {
        if (building.isAlive())
        {
          //to show range of tower, paint green box under tower
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
      
      
      //draw all buttons
      for ( Button button : _buttons )
        button.draw();
      }
    }
  
  
  void mousePressed() { 
    
    // if clicked on a button
    println(mouseX + ":" + mouseY);
    for ( Button button : _buttons ) {
      if ( button.buttonPressed() ) {
        String tag = button.getID();
        
        if ( tag.equals("genText") )
          text("hello, it's me", 500, 500);
        //clicked on shop icon
        if (tag.equals("shop") )
          {
            state = 1; //set mode to shop mode
          }
        }
    }
    
    //IF IN SHOP MODE
    if (state == 1) {
      
      //IF BUYING RESOURCES
    if (mouseX >= 510 && mouseY >= 145 && mouseY <= 390 && mouseX <= 770) {
      showResources = true;
    }
    //BUYING gold mine
    if (showResources && mouseX >= 410 && mouseY >= 65 && mouseY <= 430 && mouseX <= 755)
      buyTower(new GoldMine(mouseX, mouseY));
    
    
    //STILL NEEDS TO BE IMPLEMENTED
    //BUYING ELIXIR
    
    //IF BUYING MONSTERS
    }
    
    
    //if clicked on a tower
    for (Tower t : _towersOwned) {
        if (hoveredOver(t) && t._show == false ) {
          t._show = true;
          //store coordinates of tower range
          coords = t.showRange();
          placeItem(t);
        }
        
        
        //unshow range when unclicked
         /*
         IMPLEMENTATION HERE
         */
    }
    
    //exit to homebase, back to VIEW MODE
    if (state == 1 && 
        mouseX>= 1100 && 
        mouseX <= 1260 &&
        mouseY >= 20 &&
        mouseY <= 80) {
           showResources = false;
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
  
  boolean hoveredOver(Tower t) {
  return (mousePressed && mouseX >= (t._xcor - 50) 
        && mouseX <= (t._xcor + 50) 
        && mouseY >= (t._ycor - 50) 
        && mouseY <= (t._ycor + 50)
        );
      }
  
  //purchases Tower with gold
  //places tower according to mouse specified position
  //addes to towersOwned array
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
     
        /*
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
        */
    return true;
    }
    return false;
  }
  
 public boolean upgradeTower(Tower t) {
   return true;
 }
 
 //to place tower after its bought at mouse position 
  void placeItem(Tower t) {
    if (hoveredOver(t)) {
      if (!mousePressed) 
        t.setCoor(mouseX, mouseY);
  }
 }
  
}
