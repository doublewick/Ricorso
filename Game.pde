/**
 * Game.java
 * Joshua Raab
 * Jan 30, 2013
 * 
 * Game contains information about the overall game.
 */
 
 import java.util.ArrayList;
 
 class Game {
   
   private Ricorso parent;
   
   private ArrayList<GameLevel> gameLevels;    //A list of GameLevels that currently exist in the Game.
   private int currentLevelIndex;              //The index of the GameLevel currently active.
   private GameLevel currentLevel;             //The actual GameLevel that is currently active.
   private int maxGameLevels;                  //The maximum number of GameLevels this Game can sustain. Don't make GameLevels with an ArrayList index >= this number.
   
   private ArrayList<Player> players;
   
   public Game(Ricorso p) {
     parent = p;
     
     gameLevels = new ArrayList<GameLevel>();
     
   }

  /**
   * Basic setters and getters
   */
   
   public int getCurrentLevelIndex() {  return currentLevelIndex; }
   
   public void setCurrentLevelIndex(int levelIndex) {  currentLevelIndex = levelIndex; }

   public GameLevel getCurrentLevel() {  return currentLevel; }
   
   public void setCurrentLevel(GameLevel level) {  currentLevel = level; }

   public ArrayList<GameLevel> getGameLevels() {  return gameLevels; }  
   
   public void setMaxGameLevels(int max){ maxGameLevels = max; }
   
   public int getMaxGameLevels(){  return maxGameLevels; }
   
   public void setPlayers(ArrayList<Player> myPlayers){  players = myPlayers; }

   public Board getCurrentBoard(){ return currentLevel.getBoard(); }

   //Starts the overall game. Call ONCE PER GAME. Each level should be started as a new GameLevel, not here.
   public void startGame() {
     SetupManager sm = new SetupManager(parent);
     sm.setupGame(this);                   //Sets up core game (doesn't actually do anything now)
     sm.setupPlayers(this);                //Sets up list of players
     sm.setupGameLevel(this, players, 0);  //Sets up top GameLevel - GameLevels take a list of players, so need to set up players first

   }
     
 }
