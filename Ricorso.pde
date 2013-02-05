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
            
    //Creates an InputManager and passes it the Game, the DisplayManager, and the BattleManager
    
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
  
  //Call this ANY TIME a graphics change is required; otherwise the screen will not redraw
  public void graphicsChange() {  dm.graphicsChange(); }
 
 /**
  * TIMER CLASS
  */
 
    class Timer {
     
      int savedTime; // When Timer started
      int totalTime; // How long Timer should last
      
      Timer(int tempTotalTime) {
        totalTime = tempTotalTime;
      }
      
      // Starting the timer
      void start() {
        // When the timer starts it stores the current time in milliseconds.
        savedTime = millis(); 
      }
      
      // The function isFinished() returns true if the specified number of ms have passed. 
      // The work of the timer is farmed out to this method.
      boolean isFinished() { 
        // Check how much time has passed
        int passedTime = millis()- savedTime;
        if (passedTime > totalTime) {
          return true;
        } else {
          return false;
        }
      }
    }
 
