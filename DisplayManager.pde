/**
 * DisplayManager.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * DisplayManager handles display.
 */
 
class DisplayManager {

  private Ricorso parent;
  
  private boolean graphicsChange;            //Only redraw the screen if something has changed
  
  private Game game;
  private DisplayCentral dc;
  private DisplayTopbar dt;
  private DisplayBattle db;
  
  public DisplayManager(Ricorso p) {
    parent = p;
    graphicsChange = true;      //Initialize to true so the screen draws once
  }
  
  //Call this ANY TIME a graphics change is required, otherwise the screen will not redraw; can be called from Ricorso
  public void graphicsChange() {  graphicsChange = true; }
  
  //Only call when setting BattleManager's display.
  public DisplayBattle getDisplayBattle() {  return db; }    
  
  public void display() {
    
    if(db.isDisplaying())       //Checking this constantly for now - would look much better if checked once or twice per second
      db.display();             //Battle display
    
    if(graphicsChange){         //ONLY CALL IF SOMETHING HAS CHANGED
    
      graphicsChange = false;   //Reset graphicsChanged before doing anything else
      
      parent.background(150);   //Display background - this gets rid of unwanted stuff like old battle displays
      
      dc.display();             //Central display
      dt.display();             //Topbar display
      
    }
  }
   
  public void setGame(Game myGame){  game = myGame; }
  
  //Creates the display classes.
  public void setDisplays(Game myGame) {
    dc = new DisplayCentral(parent, myGame);
    dt = new DisplayTopbar(parent, myGame);
    db = new DisplayBattle(parent, myGame);
  }
  
  //Has DisplayBattle show a battle.
  public void showBattle(Territory attacker, Territory defender, int attackerRoll, int defenderRoll) {
    db.showBattle(attacker, defender, attackerRoll, defenderRoll); 
  }
 
}
