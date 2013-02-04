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
  
  public void display() {
    
    if(graphicsChange){         //ONLY CALL IF SOMETHING HAS CHANGED
    
      graphicsChange = false;   //Reset graphicsChanged before doing anything else
      
      dc.display();             //Central display
      dt.display();             //Topbar display
      db.display();             //Battle display
    }
  }
   
  public void setGame(Game myGame){  game = myGame; }
  
  public void setDisplays(Game myGame) {
    dc = new DisplayCentral(parent, myGame);
    dt = new DisplayTopbar(parent, myGame);
    db = new DisplayBattle(parent, myGame);
  }
 
}
