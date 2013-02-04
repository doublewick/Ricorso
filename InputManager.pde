/**
 * InputManager.java
 * Joshua Raab
 * Jan 31, 2013
 * 
 * InputManager handles player input.
 */
 
class InputManager {
   
  private Ricorso parent;
  
  private Game game;
  private DisplayManager dm;
   
  public InputManager(Ricorso p) {
    parent = p;
  }
  
  public void setGame(Game myGame) {  game = myGame; }
   
  public void setDisplayManager(DisplayManager myDM) {  dm = myDM; }  

  public void mousePressed() {
    
    //Check if clicking a Territory
    
    Territory t;
    t = getClickedTerritory();
    if(t != null)  territoryClick(t);

  }
  
  //Checks if the player has clicked on a Territory. If so, returns that Territory.
  private Territory getClickedTerritory() {
    for(int i = 0; i < game.getCurrentBoard().getBoardWidth(); i++) {
      for(int j = 0; j < game.getCurrentBoard().getBoardHeight(); j++) {
        
        Territory t = game.getCurrentBoard().getTerritories()[i][j];
        
        if(mouseOverlap(t.x,t.y,t.width,t.height))
          return t;
      } 
    }


    return null;
  }

  //Called when the player has clicked on a Territory.
  private void territoryClick(Territory t) {

    //If player owns this territory, it has >1 unit, and it's not already selected, deselect the currently selected Territory and select this one
    if( t.getOwnerIndex() == game.getCurrentLevel().getCurrentPlayerIndex() &&
        t.getUnits() > 1 &&
       !t.isSelected()) {
         game.getCurrentLevel().deselectTerritory();
         game.getCurrentLevel().selectTerritory(t);
       }
    
    //If this territory is already selected, deselect it
    else if(t.isSelected())
      game.getCurrentLevel().deselectTerritory();
    
    //If player doesn't own this territory and an adjacent territory is selected, attack it and deselect the current one
    else if( t.getOwnerIndex() != game.getCurrentLevel().getCurrentPlayerIndex() &&
             GameRules.isAdjacent(t, game.getCurrentLevel().getSelectedTerritory())) {
      
      game.getCurrentLevel().attack(t, game.getCurrentLevel().getSelectedTerritory());
      game.getCurrentLevel().deselectTerritory();
     }
    
  }
  
    
  private boolean mouseOverlap(int x, int y, int myWidth, int myHeight) {
    return(  parent.mouseX >= x && 
             parent.mouseX <= x + myWidth &&
             parent.mouseY >= y &&
             parent.mouseY <= y + myHeight);
  }  

}
