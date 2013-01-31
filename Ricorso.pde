/**
 * Ricorso.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Ricorso is the main class. It calls and runs everything else.
 */

import java.util.ArrayList;
import java.util.Random;

  ///////////////////////////////////////////////////
  // CONSTANTS
  ///////////////////////////////////////////////////

  static final int WINDOW_WIDTH = 600;
  static final int WINDOW_HEIGHT = 600;
  
  private Game game;
  private DisplayManager dm;
  private Random r;
  
  ///////////////////////////////////////////////////
  // PAPPLET
  ///////////////////////////////////////////////////
  
  void setup() {
    size(WINDOW_WIDTH, WINDOW_HEIGHT); 
    
    r = new Random();
        
    //Creates and starts a Game
    
    game = new Game(this);
    game.startGame();
    
    //Creates a DisplayManager and passes it the Game
    
    dm = new DisplayManager(this);
    dm.setGame(game);
    
  }
  
  void draw() {
     dm.display();
  }
  
  public Random getRandom(){  return r; }
 
