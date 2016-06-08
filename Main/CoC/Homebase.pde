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
    
  //choices of towers and monsters that can be beought from the shop at level
  ArrayList<Tower> _towerChoices;
  ArrayList<Monster> _monsterChoices;
  
  int[] campFireLoc = {700, 700}; //random location
  
  int state;
  /*
   0 - viewing regular home base, 
   1 - main shoppping screen, 
   2 - resources shopping screen, (aka new show resources boolean)
   3 - army shopping screen,
   4 - defenses shopping screen,
  
  */
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
  
  _monstersOwned.add(new Barbarian(600,400));
  _monstersOwned.add(new Goblin(845, 220));
  
  // load ALL buttons
  _buttons = new ArrayList<Button>();
  _buttons.add(new Button(new int[] {1100, 600}, "shop", 0, "shop.jpg"));
  // transparent buttons
  _buttons.add(new Button(new int[] {510, 145}, new int[] {770, 390}, "resourceShop", null, 1, new int[] {0,0,0}, new int[] {0,0,0,0}) );
  _buttons.add(new Button(new int[] {410, 65}, new int[] {755, 350}, "buyGoldmine", null, 2, new int[] {0,0,0}, new int[] {0,0,0,0}) );
  // add exit button for each state
  for ( int i = 0; i <= 4; i++ )
    _buttons.add(new Button(new int[] {1100, 20}, new int[] {1260, 80}, "exitToHome", null, i, new int[] {0,0,0}, new int[] {0,0,0,0}) );
    
 
   Stack actions = new Stack();
}
  
  public Homebase(String newName){
    this();
    _name = newName;
  }
  
  void draw() {
    println(state);
    //SHOP MODE
    if (state == 1) { 
    
      shopImg = loadImage("shop.png");
      image(shopImg, 0, 0, 1280, 720);
      text("Gold: " + _gold, 50, 50);
      text("Elixers: " + _elixir, 50, 70);
    }
     
     
    else if ( state == 2 ) {
       resources = loadImage("resources.jpg");
       image(resources, 0, 0, 1280, 720);
   }
    
    //VIEW MODE
    else if (state == 0) {
      
      //to reset
      bImg = loadImage("grass.jpg");
      image(bImg,0,0, 1280, 720);
  
      for ( Tower building : _towersOwned ) {
          //to show range of tower, paint green box under tower
          if (building._show)
            {
              fill(0, 255, 0, 50);
              ellipse(building._xcor, building._ycor, building._range, building._range);
            }
          fill(0,0,0); // reset
          building.draw();
      }
       
      
      //draw monster if alive, remove from array if not
      for ( Monster m : _monstersOwned ) {
        if (m.isAlive())
          m.draw(false, _towersOwned);
        else 
          _monstersOwned.remove(m);
      }
    }
    
    for ( Button button : _buttons ) {
        if ( state == button.displayScreen ) // only draw appropriate buttons
          button.draw();
      }
      
  }
  
  
  void mousePressed() { 
    
    // if clicked on a button
    println(mouseX + ":" + mouseY);
    for ( Button button : _buttons ) {
      if ( button.buttonPressed(state) ) {
        String tag = button.getID();
        
        if ( tag.equals("genText") )
          text("hello, it's me", 500, 500);
        //clicked on shop icon
        else if (tag.equals("shop") )
            state = 1; //set mode to shop mode
        else if (tag.equals("resourceShop") )
            state = 2;
        else if (tag.equals("buyGoldmine") )
            buyTower(new GoldMine(mouseX, mouseY));
        else if (tag.equals("exitToHome") )
            state = 0;  
      }
    }
    
    //IF IN SHOP MODE
    if (state == 1) {
      
      //IF BUYING RESOURCES
    //if (mouseX >= 510 && mouseY >= 145 && mouseY <= 390 && mouseX <= 770) {
    //  showResources = true;
    //}
    
    //BUYING gold mine
    //if (showResources && mouseX >= 410 && mouseY >= 65 && mouseY <= 430 && mouseX <= 755)
    //  buyTower(new GoldMine(mouseX, mouseY));
    
    
    //STILL NEEDS TO BE IMPLEMENTED
    //BUYING ELIXIR
    
    //IF BUYING MONSTERS
    }
    
    
    //if clicked on a tower
    for (Tower t : _towersOwned) {
        if (hoveredOver(t) ) {//&& t._show == false ) {
          t._show = ! t._show;
          //store coordinates of tower range
          placeItem(t);
        }
        
        
        //unshow range when unclicked
         /*
         IMPLEMENTATION HERE
         */
    }
    
    //exit to homebase, back to VIEW MODE
    /*
    if (state == 1 && 
        mouseX>= 1100 && 
        mouseX <= 1260 &&
        mouseY >= 20 &&
        mouseY <= 80) {
           showResources = false;
        state = 0;
    } */
    
  }
        
  
  public String getName(){
    return _name;
    }
  
  public ArrayList<Monster> getMonsters() {
    return _monstersOwned;
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