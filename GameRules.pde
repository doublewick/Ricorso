/**
 * GameRules.java
 * Joshua Raab
 * Feb 3, 2013
 * 
 * GameRules is a static class that contains rules for the game.
 */

import java.util.Random;
 
static class GameRules {

  public static int roll(Territory t) {
    
    Random r = new Random();
    int total = 0;
    
    for(int i = 0; i  < t.getUnits(); i++) {
       total += r.nextInt(6) + 1;
    }
    
    return total;
  }
   
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
      
    /**
     * The following method assumes the "offset grid" pattern currently in the prototype.
     * Any change in that pattern will require a change to this method.
     */
     
    //Check if t2 is in the same row as t1 and immediately to its left or right
    
    if( t2.gridY == t1.gridY &&
       (t2.gridX == t1.gridX + 1 ||
        t2.gridX == t1.gridX - 1)){
         return true;
    }
         
    //Check if t1 is one row up or down
    if( t2.gridY == t1.gridY + 1 ||
        t2.gridY == t1.gridY - 1) {
           
      //If so, need to check adjacency differently in even- and odd-numbered rows.
      if(t1.gridY % 2 == 0) {
       
        //In even-numbered rows, t2's x needs to be equal to or 1 less than t1's x
        if( t2.gridX == t1.gridX ||
            t2.gridX == t1.gridX - 1) {
              return true;
        }
      }
      
      else {
        
        //In odd-numbered rows, t2's x needs to be equal to or 1 more than t1's x
        if( t2.gridX == t1.gridX ||
            t2.gridX == t1.gridX + 1) {
              return true;
        }         
      } 
    }
        
    return false;
    
  }
  
}
