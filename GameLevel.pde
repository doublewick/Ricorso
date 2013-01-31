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
  
  public GameLevel(Ricorso p, ArrayList<Player> myPlayers, int myWidth, int myHeight) {
    super();
    parent = p;
    board = new Board(parent, myWidth, myHeight);
    players = myPlayers;
  }

  public Board getBoard() {  return board; }
  
  public void draw() {
 
  }
  
}
