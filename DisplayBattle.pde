/**
 * DisplayBattle.java
 * Joshua Raab
 * Jan 31, 2013
 * 
 * DisplayBattle shows the results of battles.
 */
 
class DisplayBattle {

  private Ricorso parent;
   
  private Game game;
  
  private boolean displaying;
   
  public DisplayBattle(Ricorso p, Game myGame) {
     parent = p;
     game = myGame;
     
     displaying = false;
  }    
  
  public void setDisplaying(boolean b) {  displaying = b; }
  
  public void display() {
    
    //FIGURE THIS OUT - attack function and this class need to talk somehow
    if(displaying){
      drawBar();
      drawResults();
    }
  }
  
  //Draws the bar the results will be shown on.
  public void drawBar() {
    
  }
  
  //Draws the results of the battle.
  public void drawResults() {
    
  }
   
}
