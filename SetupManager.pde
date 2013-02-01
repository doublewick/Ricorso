/**
 * SetupManager.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * SetupManager helps set up the game.
 */

import java.util.ArrayList;
import java.awt.Color;
 
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
       
       temp.add(new Player("David", 0, Color.RED));
       temp.add(new Player("Josh", 1, Color.BLUE));
       
       game.setPlayers(temp);
     }
   
   public void setupGameLevel(Game game, ArrayList<Player> players, int firstPlayerIndex){
     game.getGameLevels().add(new GameLevel(parent, 4, 3));               //Adds the top GameLevel
     game.setCurrentLevelIndex(0);                                        //Sets the current level index to 0
     game.setCurrentLevel(game.getGameLevels().get(0));                   //Sets the current level to the top GameLevel
     game.getCurrentLevel().setPlayers(players);                          //Adds the players into the GameLevel
     game.getCurrentLevel().setCurrentPlayerIndex(firstPlayerIndex);      //Sets the first player on this GameLevel
     populateBoard();                                                     //Populates the board with units
   }
   
    //Places units onto Board - called during setupGameLevel
    private void populateBoard() {
    
    /**
    * THIS WHOLE METHOD IS STRICTLY PROTOTYPE - FOR NOW, POPULATE BOARD RANDOMLY
    */
    
    int p1Count = 6;    //prototype only - reqs 2 players and 12 territories exactly; otherwise change it - intentionally clumsy so we don't forget to change it later
    int p2Count = 6;    //(the same)

    ArrayList<Territory> p1List = new ArrayList<Territory>();    //temp - used in assigning units randomly
    ArrayList<Territory> p2List = new ArrayList<Territory>();    //temp - used in assigning units randomly    
    
    Random r = parent.getRandom();
    Territory[][] territories = game.getCurrentBoard().getTerritories();
    
    //First, ASSIGN OWNERS - remember, p1 has ownerIndex of 0
    
    for(int i = 0; i < game.getCurrentBoard().getBoardWidth(); i++){
      for(int j = 0; j < game.getCurrentBoard().getBoardHeight(); j++){
     
        if(p1Count == 0 && p2Count == 0){
          System.out.println("You screwed it up - check SetupManager.populateBoard");    //error handling
          break;
        }

        //If either player already has 6 territories, just assign the next territory to the other player
        
        if(p1Count == 0){
          territories[i][j].setOwnerIndex(1);
          p2Count--;
          p2List.add(territories[i][j]);
        }
        
        else if(p2Count == 0){
          territories[i][j].setOwnerIndex(0);
          p1Count--;
          p1List.add(territories[i][j]);
        }
        
        //Otherwise assign the next territory to a random player and decrement the appropriate count
 
        else{
          
          int next = r.nextInt(2);
          
          if(next == 0) {
            territories[i][j].setOwnerIndex(0);
            p1Count--;
            p1List.add(territories[i][j]);
          }
          
          else if(next == 1) {
            territories[i][j].setOwnerIndex(1);
            p2Count--;
            p2List.add(territories[i][j]);
          }
        }       
      }
    }
    
   //Then, ASSIGN UNITS - just doing it manually player by player now - again, intentionally clumsy
   
   int p1UnitCount = 15;    //Just using 15 units per board for now, but this should be a constant and depend on strength in previous level
   int p2UnitCount = 15;    //(the same)
    
    //Give each territory 1 unit to start off
    for(int i = 0; i < p1List.size(); i++){
      p1List.get(i).addUnit();
      p1UnitCount--;
    }
    
    for(int i = 0; i < p2List.size(); i++){
      p2List.get(i).addUnit();
      p2UnitCount--;
    }
    
    //While player still has units to assign, assign them to a random territory
    while(p1UnitCount > 0) {
      int next = r.nextInt(p1List.size());
      p1List.get(next).addUnit();
      p1UnitCount--;
    }
    
    while(p2UnitCount > 0) {
      int next = r.nextInt(p2List.size());
      p2List.get(next).addUnit();
      p2UnitCount--;
    }
  }
}
