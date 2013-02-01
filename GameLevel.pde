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
  private int currentPlayerIndex;               //Which player's turn it is
  
  public GameLevel(Ricorso p, int myWidth, int myHeight) {
    super();
    parent = p;
    board = new Board(parent, myWidth, myHeight);
    
    currentPlayerIndex = -1;         //Dummy value - call setCurrentPlayer to the first player
  }
  
  //CALL THIS WHEN GAMELEVEL IS CREATED
  public void setPlayers(ArrayList<Player> myPlayers) { players = myPlayers; }
  
  public ArrayList<Player> getPlayers() {  return players; }
  
  //Sets player who is going now
  public void setCurrentPlayerIndex(int i) {  currentPlayerIndex = i; }
    
  public int getCurrentPlayerIndex() {  return currentPlayerIndex; }
    
  public Board getBoard() {  return board; }
  
}
