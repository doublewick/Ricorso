/**
 * InputManager.java
 * Joshua Raab
 * Jan 31, 2013
 * 
 * InputManager handles player input.
 */
 
class InputManager {
   
  private Ricorso parent;
  
  private Game game;
  private DisplayManager dm;
   
  public InputManager(Ricorso p) {
    parent = p;
  }
  
  public void setGame(Game myGame) {  game = myGame; }
   
  public void setDisplayManager(DisplayManager myDM) {  dm = myDM; }  

  public void mousePressed() {
    System.out.println("Click detected, sir!");
  }

}
