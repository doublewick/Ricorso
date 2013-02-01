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
    createTerritories(boardWidth, boardHeight);

  }
  
  public int getBoardWidth(){  return boardWidth; }
  
  public int getBoardHeight(){  return boardHeight; }
  
  public Territory[][] getTerritories() {  return territories; }
  
  //Sets up the territories. Called as part of the constructor. 
 private void createTerritories(int myBoardWidth, int myBoardHeight) {
    
   //Creates Territories in the territories array, assigning each a position and size as they are instantiated.
   for(int i = 0; i < boardWidth; i++){
     for(int j = 0; j < boardHeight; j++){
       territories[i][j] = new Territory(parent,
         DisplayCentral.BOARD_START_X + (i * DisplayCentral.TERRITORY_WIDTH),       //x
         DisplayCentral.BOARD_START_Y + (j * DisplayCentral.TERRITORY_HEIGHT),      //y
         DisplayCentral.TERRITORY_WIDTH,                                            //width
         DisplayCentral.TERRITORY_HEIGHT);                                          //height       
       }
     } 
   }
}
