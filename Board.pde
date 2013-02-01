/**
 * Board.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Board contains an array of Territories. 
 */

import java.util.Random;

class Board {

  private Ricorso parent;
  
  public Territory[][] territories;
  
  private int boardWidth;
  private int boardHeight;
  
  public Board(Ricorso p, int myBoardWidth, int myBoardHeight) {
    parent = p;
    boardWidth = myBoardWidth;
    boardHeight = myBoardHeight;
    
    territories = new Territory[boardWidth][boardHeight];
    
    for(int i = 0; i < boardWidth; i++){
      for(int j = 0; j < boardHeight; j++){
        territories[i][j] = new Territory(parent,
          DisplayManager.BOARD_START_X + (i * DisplayManager.TERRITORY_WIDTH),       //x
          DisplayManager.BOARD_START_Y + (j * DisplayManager.TERRITORY_HEIGHT),      //y
          DisplayManager.TERRITORY_WIDTH,                                            //width
          DisplayManager.TERRITORY_HEIGHT);                                         //height
          
      }
    }
 }
  
  public int getBoardWidth(){  return boardWidth; }
  
  public int getBoardHeight(){  return boardHeight; }
  
}
