/**
 * DisplayManager.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * DisplayManager handles display.
 */
 
class DisplayManager extends HObject {

  final static int TERRITORY_WIDTH = 50;     //The width of a given Territory (assuming they are rectangles)
  final static int TERRITORY_HEIGHT = 50;    //The height of a given Territory (assuming they are rectangles)
  
  final static int BOARD_START_X = 50;       //The x value of the top left corner of the top left Territory
  final static int BOARD_START_Y = 100;      //The x value of the top left corner of the top left Territory

  private Ricorso parent;
  
  private Game game;
  
  public DisplayManager(Ricorso p) {
   parent = p;
  }
  
  public void display() {
    parent.background(250);
    game.getCurrentLevel().draw();
    displayTerritories(game.getCurrentBoard()); 
    //[display topbar]
  }
   
  public void setGame(Game myGame){  game = myGame; }  

  //Displays all the Territories on the current board.
  private void displayTerritories(Board currentBoard) {
    
    for(int i = 0; i < currentBoard.getBoardWidth(); i++) {
      for(int j = 0; j < currentBoard.getBoardHeight(); j++) {
        currentBoard.territories[i][j].draw();
      } 
    }
  }
  
 }
