/**
 * DisplayCentral.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * DisplayCentral shows the Board and acts as the center of the display. 
 */

import java.awt.Color;
import processing.core.PFont;

class DisplayCentral {
   
  final static int TERRITORY_WIDTH = 50;     //The width of a given Territory (assuming they are rectangles)
  final static int TERRITORY_HEIGHT = 50;    //The height of a given Territory (assuming they are rectangles)
  
  final static int BOARD_START_X = 50;       //The x value of the top left corner of the top left Territory
  final static int BOARD_START_Y = 100;      //The y value of the top left corner of the top left Territory

  final static int UNIT_OFFSET_X = 20;        //How far to the right the unit text is offset from the top left corner of the corner of the territory
  final static int UNIT_OFFSET_Y = 35;        //How far down the unit text is offset from the top left corner of the corner of the territory

  private Ricorso parent;
   
  private Game game;
  
  private PFont unitFont;
  
  public DisplayCentral(Ricorso p, Game myGame) {
     parent = p;
     game = myGame;
     
     //Set up unit font
     
     unitFont = parent.createFont("Calibri", 24);
  }
  
  public void display() {
    
    Board currentBoard = game.getCurrentBoard();
    
    //Draws all territories, using the drawTerritory method
    for(int i = 0; i < currentBoard.getBoardWidth(); i++) {
      for(int j = 0; j < currentBoard.getBoardHeight(); j++) {
        drawTerritory(currentBoard.territories[i][j]);
      } 
    }
  }
    
  public void drawTerritory(Territory t) {
    
    //Border
    parent.stroke(0); 
    
    //Fill - reflects owner
    
    /**
     * Uses RGB values from the Color of the player indexed at this territory's ownerIndex in this GameLevel's player list (got that?)
     * This should basically just work, but if it starts causing problems we can separate it out into a couple lines to make things clearer
     */
    if(t.isSelected())
      parent.fill(255);
    else  
      parent.fill(game.getCurrentLevel().getPlayers().get(t.getOwnerIndex()).getColor().getRGB());
    
    //Draw the territory as a rectangle
    parent.rect(t.x,t.y,t.width,t.height); 
    
    //Show the territory's units - just prints a number for now
    parent.textFont(unitFont);
    parent.fill(0);
    parent.textAlign(parent.CORNER);
    parent.text(t.getUnits(), t.x + UNIT_OFFSET_X, t.y + UNIT_OFFSET_Y);
    
  }
   
}
