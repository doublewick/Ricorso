/**
 * Board.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Board contains an array of Territories with a specified width and height.
 */

import java.util.Random;

class Board {

  private Ricorso parent;
  
  private Territory[][] territories;
  
  private int boardWidth;
  private int boardHeight;
  
  public Board(Ricorso p, int myBoardWidth, int myBoardHeight) {
    parent = p;
    boardWidth = myBoardWidth;
    boardHeight = myBoardHeight;
    
    territories = new Territory[boardWidth][boardHeight];

  }
  
  public int getBoardWidth(){  return boardWidth; }
  
  public int getBoardHeight(){  return boardHeight; }
  
  public Territory[][] getTerritories() {  return territories; }

}
