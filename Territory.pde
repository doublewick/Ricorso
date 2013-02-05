/**
 * Territory.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * The Board is comprised of Territories. Each Territory is owned by a certain player and contains a certain number of dice.
 */

class Territory {
  
  private Ricorso parent;
  
  public int gridX;          //The x value in the grid.
  public int gridY;          //The y value in the grid.
  
  public int displayX;       //The x value where this Territory will be drawn. NOT its x value in the grid.
  public int displayY;       //The y value where this Territory will be drawn. NOT its x value in the grid.
  public int width;          //The width of the Territory when drawn.
  public int height;         //The height of the Territory when drawn.
  
  private int ownerIndex;    //The index of the player who owns this Territory
  private int units;         //The number of units in this Territory
  
  private boolean selected;  //Whether the Territory has been clicked on by its owner
   
  public Territory(Ricorso p, int myGridX, int myGridY, int myDisplayX, int myDisplayY, int myWidth, int myHeight) {
      parent = p;
      
      gridX = myGridX;
      gridY = myGridY;
      
      displayX = myDisplayX;
      displayY = myDisplayY;
      width = myWidth;
      height = myHeight;
      
      selected = false;
  }
   
  /**
  * Basic setters and getters
  */
   
  public int getOwnerIndex() {  return ownerIndex; }
  
  public void setOwnerIndex(int myOwnerIndex) {  ownerIndex = myOwnerIndex; }
  
  public int getUnits() {  return units; }
  
  public void setUnits(int myUnits) {  units = myUnits; }
  
  public void select() {  selected = true; }
  
  public void deselect() {  selected = false; }
  
  public boolean isSelected() {  return selected; }
  
  //Adds a single unit. Used during setup and when providing reinforcements.
  public void addUnit() {  units++; }
  
}
