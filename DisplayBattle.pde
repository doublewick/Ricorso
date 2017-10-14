/**
 * DisplayBattle.java
 * Joshua Raab
 * Jan 31, 2013
 * 
 * DisplayBattle shows the results of battles.
 */

import processing.core.PFont;

class DisplayBattle {

  final static int DISPLAY_SECONDS = 2;                   //How long the battle should display for
  
  //May be better to link these two values to the BOARD_START values in DisplayCentral, but we'll go with this for now  
  final static int DISPLAY_BATTLE_X = 50;                 //The x value of the top left corner of the battle display
  final static int DISPLAY_BATTLE_Y = 250;                //The y value of the top left corner of the battle display

  //May be better to link this to the size of the board, but we'll go with this for now
  final static int DISPLAY_BATTLE_WIDTH = 200;            //The width of the battle display
  final static int DISPLAY_BATTLE_HEIGHT = 50;            //The height of the battle display
  
  final static int FIRST_PLAYER_X_OFFSET = 10;            //The offset between the left edge of the battle display and the first player icon
  final static int PLAYER_Y_OFFSET = 10;                  //The offset between the top of the battle display and the player icons

  final static int BETWEEN_PLAYERS_X_OFFSET = 100;        //The offset between the left edge of the players' icons

  final static int TEXT_Y_OFFSET = 32;                    //The offset between the top edge of the player's icon and all his text
  
  final static int UNITS_OFFSET = 6;                      //The offset between the left edge of the player's icon and the number showing his units
  final static int EQUALS_OFFSET = 35;                    //The offset between the left edge of the player's icon and his equals sign
  final static int ROLL_OFFSET = 50;                       //The offset between the left edge of the player's icon and the number showing his roll
  
  private Ricorso parent;
   
  private Game game;
  
  private BattleClock bc;
  private Timer timer;
  private boolean isDisplaying;
  
  private PFont battleFont;
  
  private Color attackerColor;                            //The color of the attacking player
  private Color defenderColor;                            //The color of the defending player
  
  private int attackerUnits;                              //The number of units the attacker had
  private int defenderUnits;                              //The number of units the defender had
  
  private int attackerRoll;                               //The attacker's roll
  private int defenderRoll;                               //The defender's roll
   
  public DisplayBattle(Ricorso p, Game myGame) {
     parent = p;
     game = myGame;
     
     isDisplaying = false;
     
     //Set battle font
     battleFont = parent.createFont("Calibri", 20);
  }
  
  public boolean isDisplaying() {  return isDisplaying; }
  
  public void display() {
    battleCheck();
    drawBar();
    drawResults();
  }
  
  //Draws the bar the results will be shown on.
  public void drawBar() {
    parent.stroke(0);
    parent.fill(255);
    parent.rect(  DISPLAY_BATTLE_X,            //x
                  DISPLAY_BATTLE_Y,            //y
                  DISPLAY_BATTLE_WIDTH,        //width
                  DISPLAY_BATTLE_HEIGHT);      //height
  }
  
  //Draws the results of the battle.
  public void drawResults() {
    
    //Draw colored squares showing the number of dice in each territory
    parent.stroke(0);
    
    parent.fill(attackerColor.getRGB());
    parent.rect(  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET,                                //x
                  DISPLAY_BATTLE_Y + PLAYER_Y_OFFSET,                                      //y
                  30,                                                                      //width
                  30);                                                                     //height
    
    parent.fill(defenderColor.getRGB());
    parent.rect(  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + BETWEEN_PLAYERS_X_OFFSET,     //x
                  DISPLAY_BATTLE_Y + PLAYER_Y_OFFSET,                                      //y
                  30,                                                                      //width
                  30);                                                                     //height


    //Draw the number of units in each territory plus an "x"
    parent.textFont(battleFont);

    parent.fill(0);
    parent.text(  attackerUnits + "x",                                                                    //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + UNITS_OFFSET,                                //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
    
    parent.text(  defenderUnits + "x",                                                                    //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + BETWEEN_PLAYERS_X_OFFSET + UNITS_OFFSET,     //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
              
    //Draw the equals signs 
    parent.text(  "=",                                                                                    //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + EQUALS_OFFSET,                               //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
    
    parent.text(  "=",                                                                                    //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + BETWEEN_PLAYERS_X_OFFSET + EQUALS_OFFSET,    //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
                  
    //Draw the dice rolls from each territory
    parent.text(  attackerRoll,                                                                           //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + ROLL_OFFSET,                                 //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
    
    parent.text(  defenderRoll,                                                                           //text 
                  DISPLAY_BATTLE_X + FIRST_PLAYER_X_OFFSET + BETWEEN_PLAYERS_X_OFFSET + ROLL_OFFSET,      //x
                  DISPLAY_BATTLE_Y + TEXT_Y_OFFSET);                                                      //y
        
    
  }
  
  public void showBattle(Territory attacker, Territory defender, int myAttackerRoll, int myDefenderRoll) {
   
    //Start the BattleClock (to display for x seconds)
    bc = new BattleClock();
    timer = new Timer(1000);
    timer.start();
    
    //Set attacker and defender colors
    attackerColor = game.getCurrentLevel().getPlayers().get(attacker.getOwnerIndex()).getColor();
    defenderColor = game.getCurrentLevel().getPlayers().get(defender.getOwnerIndex()).getColor();
    
    //Set attacker and defender unit numbers
    attackerUnits = attacker.getUnits();
    defenderUnits = defender.getUnits();
    
    //Set attacker and defender rolls
    attackerRoll = myAttackerRoll;
    defenderRoll = myDefenderRoll;
    
    //Set isDisplaying to true
    isDisplaying = true;
  }
  
     
  public void battleCheck() {

    if(timer.isFinished()) {
      timer.start();
      bc.update();
      
      if(!bc.battleOver()){
        isDisplaying = true;
        parent.graphicsChange();
      }
      
      else{
        isDisplaying = false;
        parent.graphicsChange();
      }
    }
  }   
}

  private class BattleClock{
    //BattleClock counts the time until the BattleDisplay should stop displaying the results of the battle.
    
    int displaySeconds;   //Number of seconds to have BattleDisplay draw the battle
    int seconds;          //Number of seconds passed since BattleTimer was activated
    
    BattleClock() {
      seconds = 0;
      displaySeconds = DisplayBattle.DISPLAY_SECONDS;
    }
      
    void update() {
      seconds++;
    }
    
    boolean battleOver() {
      return seconds > displaySeconds;
    }
  }


