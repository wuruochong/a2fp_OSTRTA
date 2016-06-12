import java.util.ArrayList; //for inventory?
import java.util.Stack; //to store actions

public class Homebase{
  int _drawTicks;
  
  String _name;
  int _gold;
  int _elixir;
  
  LList<Tower> _towersOwned;
  LList<Monster> _attackMonsters;
  MonsterHouse _house;
  Deque<Monster> _makeMonsterQueue;
  //LList<Monster> _monstersOwned;
  
  ArrayList<Button> _buttons;
  
  PImage bImg;
  PImage shopImg;
  PImage bShopImg;
  PImage resources;
  PImage troopPanel;
    
  //choices of towers and monsters that can be beought from the shop at level
  ArrayList<Tower> _towerChoices;
  ArrayList<Monster> _monsterChoices;
  
  String[] _monsterNames = { "Archer", "WallBreaker", "Wizard", "Barbarian", "Giant", "Goblin"}; //for generating buttons
  String[] _towerNames = { "Tesla", "Canon", "Sniper"};// "idk", "idk2"};//for generating buttons
  String[] _towerPics = {"tesla.gif", "canon.png", "sniper.gif"};//, null, null};
  
  int[] campFireLoc = {700, 700}; //random location
  int exp;
  int tierChosen;
  
  int state;
  /*
   0 - viewing regular home base, 
   1 - main shoppping screen, 
   2 - resources shopping screen, (aka new show resources boolean)
   3 - army shopping screen,
   4 - defenses shopping screen,
   5- choosing tier
   6 - being attacked by AI monster
  
  */
 public Homebase() {
   //attributes 
   _drawTicks = 0;
  _name = "default";
  _gold = 9999;
  _elixir = 9999;
  exp = 0;
  
  _towersOwned = new LList<Tower>();
  _house = new MonsterHouse(250, 350);
  _makeMonsterQueue = new Deque<Monster>();
  _attackMonsters = new LList<Monster>();
  
  //_monstersOwned = new LList<Monster>();
  
  //default items owned
  _towersOwned.add(new Canon(900, 300));
  _towersOwned.add(new TownHall(600, 450));
  _towersOwned.add(new GoldMine(300, 200));
  _towersOwned.add(_house);
  
  _towerChoices = new ArrayList<Tower>();
  _monsterChoices = new ArrayList<Monster>();
  
  _towerChoices.add(new Defense(900, 350));
  _monsterChoices.add(new Barbarian());
 
  _house.addMonster(new Archer(100,100));
  _house.addMonster(new Barbarian(100,100));
  //_house.addMonster(new Wizard(100,100));
  _house.addMonster(new Goblin(100,100));
  _house.addMonster(new Giant(100,100));

  
  // load ALL buttonswadse
  _buttons = new ArrayList<Button>();
  _buttons.add(new Button(new int[] {1100, 600}, "shop", 0, "shop.jpg"));
  // transparent buttons
  _buttons.add(new Button(new int[] {110, 145}, "resourceShop", 1, "resources.png") );
  _buttons.add(new Button(new int[] {510, 145}, "armyShop", 1, "army.png" ) );
  _buttons.add(new Button(new int[] {910, 145}, "defenseShop", 1,"defenses.png" ) );
  
  _buttons.add(new Button(new int[] {410, 65}, "buyGoldmine", 2, "goldmine.png") );
  _buttons.add(new Button(new int[] {30,60}, "buyElixircollector", 2, "elixircollector.png") );
  
  //TROOP SELECTION
  int tmpX = 225;
  for (int i = 0; i < _monsterNames.length; i ++ ){
  _buttons.add (new Button (new int[] {tmpX, 225}, new int[] {tmpX+93, 340}, _monsterNames[i], null, 3, new int[] {0,0,0}, new int[] {0,0,0,0} ));
  tmpX +=  112;
  }  // Archer, Wall breaker, Wizard, Barbarian, Giant, Goblin
  
  tmpX=225;
  for (int i = 0; i < _towerNames.length; i ++ ){
  _buttons.add (new Button (new int[] {tmpX, 225}, _towerNames[i], 4, _towerPics[i]));
  tmpX +=  162;
  }//Button(int[] coor1, String tag, int screen, String i)
  
  // add exit button for each state
  for ( int i = 0; i <= 4; i++ )
    _buttons.add(new Button(new int[] {1200, 20}, "exitToHome", i, "x.png") );
    
   
   Stack actions = new Stack();
}
  
  public Homebase(String newName){
    this();
    _name = newName;
  }
  
  void draw() {
    _drawTicks += 1;
    //SHOP MODE
    
    bShopImg = loadImage("bgd.jpg");
    image(bShopImg, 0, 0, 1280, 720);
    
    if (state == 1) { 
      fill(0);
      text("SHOP", 600, 50);
      text("Gold: " + _gold, 98, 120);
      text("Elixers: " + _elixir, 520, 120);
    }
     
     
    else if ( state == 2 ) {
      fill(0);
      text("RESOURCES", 600, 50);
      text("Your Gold: " + _gold, 800, 50);
      text("Cost: 150", 98, 310);
      text("Cost: 150", 520, 310);
   }
   
   else if (state == 3) {
     troopPanel= loadImage("troops.jpg");
     image(troopPanel, 200, 200, 700, 150);
   
   }
  
  else if (state == 4) {
     fill(0);
     text("TESLA", 225,400);
     text("CANON", 392,400);
     text("SNIPER", 550,400);
   }
    
    //VIEW MODE
    else if (state == 0) {
      
      //to reset
      bImg = loadImage("grass.jpg");
       //bImg = loadImage("maze3.jpg");
      image(bImg,0,0, 1280, 720);
    
      // make monsters in queue
      if ( ! _makeMonsterQueue.isEmpty() ){
        Monster monster = _makeMonsterQueue.peekFront();
        if ( monster._trainingTime > 0 ) // not ready to be made yet
          monster._trainingTime -= 1;
        else {// ready
          _makeMonsterQueue.dequeueFront(); // remove monster from queue  
          _house.addMonster(monster);
        }
      }
  
      for ( Tower building : _towersOwned ) {
          //to show range of tower, paint green box under tower
          if (building._show){
              fill(0, 255, 0, 50);
              ellipse(building._xcor, building._ycor, building._range, building._range);
          }
          fill(0,0,0); // reset
          building.draw();
      }
       
      // draw monsters
      Iterator<Monster> iter = getMonsters().iterator();
      while ( iter.hasNext() ) {
        Monster m = (Monster)(iter.next());
        if ( m.isAlive() )
          m.drawAttack(false, _towersOwned);
        else
          iter.remove();
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
        else if (tag.equals("buyGoldmine") ) {
            state = 0;
            buyTower(new GoldMine(mouseX, mouseY));
        }
        else if (tag.equals("buyElixircollector") ) {
            state = 0;
            buyTower(new ElixirCollector(mouseX, mouseY) );
        }
         else if (tag.equals("armyShop") ) {
           state = 3;
         }
            else if (tag.equals("defenseShop") ) {
           state = 4;
         }
         
        else if (tag.equals("buyElixircollector") ) {
            state = 0;
            buyTower(new ElixirCollector(mouseX, mouseY) );
        }
        
        //BUYING MONSTERS
        else if (tag.equals("Archer") ) {
            state = 0;
            buyMonster(new Archer(mouseX, mouseY) );
        }
        else if (tag.equals("Wizard") ) {
            state = 0;
            buyMonster(new Wizard(mouseX, mouseY) );
        } 
        else if (tag.equals("Barbarian") ) {
            state = 0;
            buyMonster(new Barbarian(mouseX, mouseY) );
        } 
        else if (tag.equals("Giant") ) {
            state = 0;
            buyMonster(new Giant(mouseX, mouseY) );
        } 
        else if (tag.equals("Goblin") ) {
            state = 0;
            buyMonster(new Goblin(mouseX, mouseY) );
        }
        else if (tag.equals("WallBreaker") ) {
            state = 0;
            buyMonster(new WallBreaker(mouseX, mouseY) );
        }
        
        //BUYING DEFENSES
        else if (tag.equals("Tesla")) {
            state = 0;
            buyTower(new Tesla(mouseX, mouseY) );
        
        }
        else if (tag.equals("Canon")) {
            state = 0;
            buyTower(new Canon(mouseX, mouseY) );
        
        }
        else if (tag.equals("Sniper")) {
            state = 0;
            buyTower(new Sniper(mouseX, mouseY) );
        
        }
        
        //EXIT
        else if (tag.equals("exitToHome") )
            state = 0;  
        break;
      }
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
  }
        
  
  public String getName(){
    return _name;
    }
  
  public LList<Monster> getMonsters() {
    return _house.getMonsters();
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
          // DO THE MOVE THING HERE; TRY NOT TO CHANGE ANYTHING ELSE
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
        _makeMonsterQueue.enqueueBack(mon);
        return true;
      }
      return false;
  }
  
 public boolean upgradeTower(Tower t) {
   return true;
 }
 
   public void placeItem(Tower t) {
     t.setCoor(mouseX, mouseY);
   }

   
 //to place tower after its bought at mouse position 
 // IS THIS DRAGGING?
  void moveItem(Tower t) {
    if (hoveredOver(t)) {
      if (!mousePressed) 
        t.setCoor(mouseX, mouseY);
  }
 }
  
}
