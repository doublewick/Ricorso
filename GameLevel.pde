/**
 * GameLevel.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * GameLevel contains information about a single level of the game.
 */
 
 class GameLevel {
  
  private Ricorso parent;

  private Board board;
  private ArrayList<Player> players;
  private int currentPlayerIndex;      //Which player's turn it is
  
  private Territory selectedTerritory;
  
  public GameLevel(Ricorso p) {
    super();
    parent = p;
    
    currentPlayerIndex = -1;           //Dummy value - call setCurrentPlayer to the first player
  }
  
  //CALL THIS WHEN GAMELEVEL IS CREATED
  public void setPlayers(ArrayList<Player> myPlayers) { players = myPlayers; }
  
  public ArrayList<Player> getPlayers() {  return players; }
  
  //Sets player who is going now
  public void setCurrentPlayerIndex(int i) {  currentPlayerIndex = i; }
    
  public int getCurrentPlayerIndex() {  return currentPlayerIndex; }
  
  public void setBoard(Board myBoard) {  board = myBoard; }
  
  public Board getBoard() {  return board; }
  
  public Territory getSelectedTerritory() {  return selectedTerritory; }
  
  //Selects a Territory. This involves setting its selected boolean to true and setting it to be GameLevel's selectedTerritory.
  public void selectTerritory(Territory t) {
    t.select();
    selectedTerritory = t;
    parent.graphicsChange();
  }
  
  //Deselects a Territory. This involves setting its selected boolean to false and setting GameLevel's selectedTerritory to null.
  public void deselectTerritory() {
    if(selectedTerritory != null)  selectedTerritory.deselect(); 
    selectedTerritory = null;
    parent.graphicsChange();
  }
 
  //Handles an attack from t1 into t2.
  //This could be pushed to GameRules, but it's simple enough to keep here for now.
  public void attack(Territory t1, Territory t2) {
    
   
    
  }
  
}
