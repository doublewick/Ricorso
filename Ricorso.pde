/**
 * Ricorso.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Ricorso is the main class. It calls and runs everything else.
 */

import java.util.ArrayList;
import java.util.Random;

  static final int WINDOW_WIDTH = 600;
  static final int WINDOW_HEIGHT = 600;
  
  private Game game;
  private DisplayManager dm;
  private InputManager im;
  private Random r;
  
  void setup() {
    size(WINDOW_WIDTH, WINDOW_HEIGHT); 
    
    r = new Random();
        
    //Creates and starts a Game
    
    game = new Game(this);
    game.startGame();
    
    //Creates a DisplayManager, passes it the Game, and has it set up the other displays
    
    dm = new DisplayManager(this);
    dm.setGame(game);
    dm.setDisplays(game);
    
    //Creates an InputManager and passes it the Game and the DisplayManager 
    
    im = new InputManager(this);
    im.setGame(game);
    im.setDisplayManager(dm);
    
  }
  
  void draw() {
     dm.display();
  }
  
  public void mousePressed() {
    im.mousePressed();
  }
  
  public Random getRandom(){  return r; }
 
