/**
 * DisplayTopbar.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * DisplayTopbar appears above DisplayCentral and displays turn order and reinforcement counts.
 */

import java.util.ArrayList;
import java.awt.Color;
import processing.core.PImage;

class DisplayTopbar {
   
  //May be better to link these two values to the BOARD_START values in DisplayCentral, but we'll go with this for now  
  final static int TOPBAR_X = 50;                //The x value of the top left corner of the DisplayTopbar
  final static int TOPBAR_Y = 50;                //The y value of the top left corner of the DisplayTopbar

  final static int TOPBAR_WIDTH = 200;           //The width of the DisplayTopbar
  final static int TOPBAR_HEIGHT = 50;           //The height of the DisplayTopbar
  
  final static int FIRST_PLAYER_X_OFFSET = 10;   //The offset from the left edge of the topbar of the first player displayed
  final static int PLAYER_Y_OFFSET = 10;         //The offset from the top edge of the topbar for all players
  
  final static int BETWEEN_PLAYERS_X_OFFSET = 80;         //The offset between the left edge of each player's icon
  
  final static int CURRENT_PLAYER_ICON_X_OFFSET = 5;             //The offset between the right edge of a player's icon and the current player icon
  final static int CURRENT_PLAYER_ICON_Y_OFFSET = 3;             //The offset between the top edge of a player's icon and the current player icon
  
  
  private Ricorso parent;
  
  private Game game;
   
  private PImage currentPlayerIcon;
   
  public DisplayTopbar(Ricorso p, Game myGame) {
     parent = p;
     game = myGame;
     
     //Load current player icon
     
     currentPlayerIcon = parent.loadImage("sword.png");
  }
  
  public void display() {
    drawTopbar();
    drawPlayers();
    drawCurrentPlayerIcon();
  }
  
  //Draws the topbar itself. Other stuff will be drawn on top.
  public void drawTopbar() {
    
    parent.stroke(0);
    parent.fill(255);
    parent.rect(  TOPBAR_X,             //x
                  TOPBAR_Y,             //y
                  TOPBAR_WIDTH,         //width
                  TOPBAR_HEIGHT);       //height
  }
  
  //Draws the players and the number of reinforcements each would currently receive.
  public void drawPlayers() {
    
    ArrayList<Player> players = game.getCurrentLevel().getPlayers();
    
    for(int i = 0; i < players.size(); i++) {
      
      //Just draw a rectangle in their color for now
      
      parent.stroke(0);
      parent.fill(players.get(i).getColor().getRGB());
      parent.rect(  TOPBAR_X + FIRST_PLAYER_X_OFFSET + (BETWEEN_PLAYERS_X_OFFSET * i),   //x
                    TOPBAR_Y + PLAYER_Y_OFFSET,                                          //y
                    30,                                                                  //width
                    30);                                                                 //height               
    }
  }
  
  //Draws something showing whose turn it is.
  public void drawCurrentPlayerIcon() {
    
    int currentPlayerIndex = game.getCurrentLevel().getCurrentPlayerIndex();
    parent.image(currentPlayerIcon,
                    TOPBAR_X + FIRST_PLAYER_X_OFFSET + (30) + (BETWEEN_PLAYERS_X_OFFSET * currentPlayerIndex) + CURRENT_PLAYER_ICON_X_OFFSET,  //x
                    TOPBAR_Y + PLAYER_Y_OFFSET + CURRENT_PLAYER_ICON_Y_OFFSET);                                                                //y
  }
  
}  


