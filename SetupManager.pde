/**
 * SetupManager.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * SetupManager helps set up the game.
 */
 
import java.util.ArrayList;
 
class SetupManager {
   
  private Ricorso parent;
  
   public SetupManager(Ricorso p) {
     parent = p;
   }
  
   public void setupGame(Game game) {
     //Doesn't do anything now, but could be called on to do some setup before players join
   }
  
   public void setupPlayers(Game game) {
       //For now, just make an ArrayList of 2 players and pass that back up to the Game
       
       ArrayList<Player> temp = new ArrayList<Player>();
       
       temp.add(new Player("David", 0));
       temp.add(new Player("Josh", 1));
       
       game.setPlayers(temp);
     }
   
   public void setupGameLevel(Game game, ArrayList<Player> players){
     game.getGameLevels().add(new GameLevel(parent, players, 3, 4));
     game.setCurrentLevelIndex(0);
     game.setCurrentLevel(game.getGameLevels().get(0));
   }
   
   
}
