/**
 * Player.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Player stores values like name and index, and is frequently referenced by other classes.
 * For example, a Territory remembers what Player owns it, and GameEngine remembers what Player's turn it is.
 */
 
 class Player {
   
  private String name;
  private int index;
   
     public Player(String myName, int myIndex) {
        name = myName;
        index = myIndex;
     }
   
     public String getName(){  return name; }
     
     public int getIndex(){  return index; }
   
 }
