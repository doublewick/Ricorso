/**
 * GameRules.java
 * Joshua Raab
 * Feb 3, 2013
 * 
 * GameRules is a static class that contains rules for the game.
 */
 
 static class GameRules {

  //Gets the number of reinforcements the player would currently receive.
  public static int getReinforcements(Player player, GameLevel gameLevel) {
    
    //Right now, just return the total number of territories this player owns on this GameLevel.
    //May want to change it to be the highest number of contiguous territories this player owns on this GameLevel. (Shouldn't be too hard, using the isAdjacent function below.)
    
    int reinforcements = 0;
    
    for(int i = 0; i < gameLevel.getBoard().getBoardWidth(); i++) {
      for(int j = 0; j < gameLevel.getBoard().getBoardHeight(); j++) {
         if(gameLevel.getBoard().getTerritories()[i][j].getOwnerIndex() == player.getCurrentLevelIndex())
           reinforcements++;
      }
    }
    
    return reinforcements;
  }
   
  //Checks if these Territories are adjacent. (If either is null, returns false.)
  public static boolean isAdjacent(Territory t1, Territory t2) {
    
    if(t1 == null || t2 == null)  
      return false;
      
    return true;
    
  }
  
}
