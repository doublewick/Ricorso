/**
 * GameSetupManager.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * GameSetupManager helps set up the overall Game.
 * -- IMPORTANT - Use LevelSetupManager to set up a GameLevel. --
 */

import java.util.ArrayList;
import java.awt.Color;
 
class GameSetupManager {
   
  private Ricorso parent;
  
  private Game game;
  
  public GameSetupManager(Ricorso p, Game myGame) {
    parent = p;
    game = myGame;
  }
  
  public void setupGame() {
    //Doesn't do anything now, but could be called on to do some setup before players join
  }
  
  public void setupPlayers() {
    //For now, just make an ArrayList of 2 players and pass that back up to the Game
       
    ArrayList<Player> temp = new ArrayList<Player>();
       
    temp.add(new Player("David", 0, Color.RED));
    temp.add(new Player("Josh", 1, Color.BLUE));
       
    game.setPlayers(temp);
  }
}
