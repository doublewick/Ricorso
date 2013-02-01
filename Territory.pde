/**
 * Territory.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * The Board is comprised of Territories. Each Territory is owned by a certain player and contains a certain number of dice.
 */
 
class Territory {
  
  private Ricorso parent;
  
  public int x;
  public int y;
  public int width;
  public int height;
  
  private int ownerIndex;    //The index of the player who owns this Territory
  private int dice;        //The number of dice in this Territory
  
  private boolean active;  //Whether the Territory has been clicked on by its owner
   
  public Territory(Ricorso p, int myX, int myY, int myWidth, int myHeight) {
      parent = p;
      x = myX;
      y = myY;
      width = myWidth;
      height = myHeight;
  }
   
  /**
  * Basic setters and getters
  */
   
  public int getOwnerIndex(){  return ownerIndex; }
  
  public void setOwnerIndex(int myOwnerIndex){  ownerIndex = myOwnerIndex; }
  
  public int getDice(){  return dice; }
  
  public void setDice(int myDice){  dice = myDice; }

  public void draw() {
    parent.rect(x,y,width,height);
  }
  
   
 }
