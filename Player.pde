/**
 * Player.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Player stores values like name and index, and is frequently referenced by other classes.
 * For example, a Territory remembers what Player owns it, and GameEngine remembers what Player's turn it is.
 */
 
import java.awt.Color;
 
class Player {
   
  private String name;                    //The player's name
  private int currentLevelIndex;          //The player's index IN THE CURRENT LEVEL - use name or something to identify across levels
  private Color playerColor;              //The player's color - can't use the variable name "color" - this is a primitive in Processing
   
  public Player(String myName, int myIndex, Color myColor) {
    name = myName;
    currentLevelIndex = myIndex;
    playerColor = myColor;
  }
   
  public String getName() {  return name; }
     
  public int getCurrentLevelIndex() {  return currentLevelIndex; }
  
  public void setCurrentLevelIndex(int i) {  currentLevelIndex = i; }
   
  public Color getColor() { return playerColor; }   
   
 }
