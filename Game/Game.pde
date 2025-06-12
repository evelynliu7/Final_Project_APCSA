import processing.sound.*;
SoundFile buttonClick;
SoundFile boomerangThrow;
SoundFile pickUp;
SoundFile teleport;
SoundFile tileFall;
SoundFile victory;

char[] arrowKeys = {(char)UP, (char)LEFT, (char)DOWN, (char)RIGHT};
Player Player1 = new Player(1, arrowKeys, 700, 70);

char[] WASD = {'w', 'a', 's', 'd'};
Player Player2 = new Player(2, WASD, 70, 430);

int screen=0;
ArrayList<Map> maps = new ArrayList<Map>();
Map currMap;
int timeStartClicked = 0;
Button start, home, rematch, directions;
Button Maze, FallingTiles, Spin;

PFont f;
//int testing_counter=0;

String winner, loser;

void setup(){
  size(800, 500);
  
  String[] fontList = PFont.list();
  printArray(fontList);
  
  Map mazeMap = new MazeMap(); //game maze
  maps.add(mazeMap);
  Map fallingTilesMap = new FallingTilesMap();
  maps.add(fallingTilesMap);
  Map RotatingBlockMap = new RotatingBlockMap();
  maps.add(RotatingBlockMap);
  
  start = new Button(500, 150, 100, 200, "START", 20);
  directions = new Button(500, 275, 100, 200, "DIRECTIONS", 15);
  home = new Button(720, 425, 50, 75, "HOME", 15);
  //rematch =
  Maze = new Button (50, 125, 100, 200, "MAZE", 20);
  FallingTiles = new Button(300, 125, 100, 200, "FALLING TILES", 20);
  Spin = new Button(550, 125, 100, 200, "SPIN", 20);
  
  buttonClick = new SoundFile(this, "Sounds/ButtonClick.mp3");
  boomerangThrow = new SoundFile(this, "Sounds/BoomerangThrow.mp3");
  pickUp = new SoundFile(this, "Sounds/PickUp.mp3");
  teleport = new SoundFile(this, "Sounds/Teleport.mp3");
  tileFall = new SoundFile(this, "Sounds/TileFall.mp3");
  victory = new SoundFile(this, "Sounds/Victory.mp3");
  
  f=createFont("Jokerman", 24);
  //frameRate(5);
}

void draw(){
  //if (!Player1.hasBoomerang) {
  //  println("bruh");
  //}
  
  if(screen == -1){ //winner screen
    textSize(80);
    fill(255, 102, 125);
    text(winner+" WON!", 400, 200);
    //Player1.displayLives();
    //Player2.displayLives();
  }
  else if (screen==0) { //home screen
    background(255, 212, 184);
    textFont(f, 50);
    textAlign(LEFT, BASELINE);
    rectMode(CORNER);
    fill(255, 102, 125);
    text("BOOMERANG", 30, 175);
    text("FU", 145, 225);
    
    start.display();
    directions.display();
  }
  else if(screen == 1){ //directions
    background(255, 240, 217);
    fill(255, 157, 149);
    textSize(30);
    text("Directions:", 400, 20);
    textSize(22);
    text("Welcome to Boomerang Fu, an interactive two-player game!", 400, 50);
    textSize(18);
    text("Each player controls a character who can throw and catch a boomerang.", 400, 90);
    text("Hit your opponent with your boomerang to make them lose a life!", 400, 110);
    text("Player 1 moves with arrow keys.", 400, 140);
    text("Double-tap any of these keys to throw the boomerang in that direction.", 400, 160);

    text("Player 2 moves with W, A, S, D keys.", 400, 190);
    text("Double-tap any of these keys to throw the boomerang in that direction.", 400, 210);

    text("Boomerang returns unless blocked by a wall.", 400, 250);
    text("If blocked, walk to the boomerang to pick it up.", 400, 270);

    text("Each player starts with 6 lives.", 400, 310);
    text("Lose all lives and you lose the game!", 400, 330);

    text("Multiple maps with mazes and hazards will be played.", 400, 370);
    text("Avoid holes and stay within the map boundaries!", 400, 390);
    home.display();
  }
  else if(screen == -2){ //map select
    background(255, 240, 217);
    fill(255, 157, 149);
    textSize(40);
    text("Choose your Map", 400, 50);
    Maze.display();
    FallingTiles.display();
    Spin.display();
    
    if(Maze.inside(mouseX, mouseY)){
      fill(255, 157, 149);
      textSize(20);
      text("A rectangular maze with portals allowing players to teleport.", 400, 320);
      text("Note: The boomerang will stick to the wall if hit. Players must ", 400, 370);
      text("walk up to their boomerang to retrive it.", 400, 420);
    }
    if(FallingTiles.inside(mouseX, mouseY)){
      fill(255, 157, 149);
      textSize(20);
      text("A rectangular map composed of square tiles that become darker the", 400, 320);
      text("longer players stay on them. Once a tile turns white, it has fallen,", 400, 370);
      text("and players will die if they try to walk across it.", 400, 420);
    }
    if(Spin.inside(mouseX, mouseY)){
      fill(255, 157, 149);
      textSize(19);
      text("A rectangular map with two spinning logs at the center. The logs act", 400, 320);
      text("like walls: players cannot walk through them, and boomerangs stick to", 400, 370);
      text("them. If players stand in the way of the log, they will be pushed with it.", 400, 420);
    }
  }
  else{    
    background(221, 237, 196);
    //make background specific map
    currMap = maps.get(screen-2);
    currMap.display();
    
    if(frameCount % Player1.speed == 0){
      currMap.checkCollision(Player1);
      Player1.move();
      currMap.checkCollision(Player1);
    }
    currMap.checkCollision(Player1.PlayerBoomerang);
    Player1.PlayerBoomerang.move();
    currMap.checkCollision(Player1.PlayerBoomerang);
    checkPickup(Player1, Player1.getBoomerang());
    Player1.display();
    Player1.PlayerBoomerang.display();
    currMap.checkCollision(Player1.PlayerBoomerang);
    Player1.checkHit(Player2);
    currMap.checkCollision(Player1);
    currMap.checkCollision(Player1.PlayerBoomerang);
    boolean p1_tp = currMap.teleported(Player1);
    
    if(Player1.dead()){
      victory.play();
      screen = -1;
      winner = "Player 2";
      loser = "Player 1";
    }
    
    Player1.displayLives();
    
    if(frameCount % Player2.speed == 0){
      currMap.checkCollision(Player2);
      Player2.move();
      currMap.checkCollision(Player2);
    }
    currMap.checkCollision(Player2.getBoomerang());
    Player2.PlayerBoomerang.move();
    checkPickup(Player2, Player2.getBoomerang());
    Player2.display();
    Player2.PlayerBoomerang.display();
    currMap.checkCollision(Player2.getBoomerang());
    Player2.checkHit(Player1);
    currMap.checkCollision(Player2);
    currMap.checkCollision(Player2.PlayerBoomerang);
    boolean p2_tp = currMap.teleported(Player2);
    
    if(Player2.dead()){
      victory.play();
      screen = -1;
      winner = "Player 1";
      loser = "Player 2";
    }
    
    Player2.displayLives();
    resetMatrix();
    rectMode(CORNER);
    textAlign(LEFT, BASELINE);
    home.display();
    
    if(screen == 2){
      if(p1_tp || p2_tp){
        teleport.play();
      }
    }
    if(screen==3){
      if(currMap.updateTime(Player1.getpos(), Player1.getprevPos()) || currMap.updateTime(Player2.getpos(), Player2.getprevPos())){
        tileFall.play();
      }
    }
    
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP) Player1.setUP(true);
    if(keyCode==LEFT) Player1.setLEFT(true);
    if(keyCode==DOWN) Player1.setDOWN(true);
    if(keyCode==RIGHT) Player1.setRIGHT(true);
  }
  
  if (keyCode == 'W') Player2.setUP(true);
  if (keyCode == 'A') Player2.setLEFT(true);
  if (keyCode == 'S') Player2.setDOWN(true);
  if (keyCode == 'D') Player2.setRIGHT(true);
  
  checkDoubleClick((char)keyCode, Player1);
  checkDoubleClick((char)keyCode, Player2);
}

void checkDoubleClick(char directionKey, Player p){
  boolean DoubleClick = false;
    
  if(!p.getKeyPressed()){
    p.setKeyPressed(true);
    p.setKeyReleased(false);
    p.setKeyTime(millis());
  }
  else{
    if(millis() - p.getKeyTime() <= 200 && p.getKeyReleased()){
      DoubleClick = true;
      p.setKeyPressed(false);
    }
    else{
      if(p.getKeyReleased()) p.setKeyTime(millis());
      p.setKeyReleased(false);
    }
  }
  
  if(DoubleClick){
    p.throwBoomerang(directionKey);
    boomerangThrow.play();
  }
  
}

public void checkPickup(Player player, Boomerang boomerang) {
  if (boomerang.isStopped()) {
    float pickupDistance = 15;  
    
    if (PVector.dist(player.pos, boomerang.getLocation()) < pickupDistance) {
      player.setHasBoomerang(true);
      boomerang.pickupByPlayer();
      if(!player.getBeingPushed()) pickUp.play();
    }
  }
}



void keyReleased(){
  if(key==CODED){
    if(keyCode==UP){
      Player1.setUP(false);
    }
    if(keyCode==LEFT) Player1.setLEFT(false);
    if(keyCode==DOWN) Player1.setDOWN(false);
    if(keyCode==RIGHT) Player1.setRIGHT(false);
    Player1.setKeyReleased(true);
  }
  else{
    if (keyCode == 'W'){
      Player2.setUP(false);
    }
    if (keyCode == 'A') Player2.setLEFT(false);
    if (keyCode == 'S') Player2.setDOWN(false);
    if (keyCode == 'D') Player2.setRIGHT(false);
    Player2.setKeyReleased(true);
  }
  
}

void mousePressed() {
  boolean buttonClicked = false;  
  if(screen==0){
    if(start.inside(mouseX, mouseY)){
      timeStartClicked = millis();
      buttonClicked = true;
      screen = -2;
    }
    if(directions.inside(mouseX, mouseY)){
      buttonClicked = true;
      screen = 1;
    }
  }
  
  if(screen>=1){
    if(home.inside(mouseX, mouseY)){
      reset();
      buttonClicked = true;
      screen = 0;
    }
  }
  
  if(screen == -1){
    if(home.inside(mouseX, mouseY)){
      buttonClicked = true;
      reset();
      screen = 0;
    }
  }
  
  if(screen == -2){
    if(Maze.inside(mouseX, mouseY)){
      buttonClicked = true;
      screen = 2;
    }
    if(FallingTiles.inside(mouseX, mouseY)){
      buttonClicked = true;
      screen = 3;
    }
    if(Spin.inside(mouseX, mouseY)){
      if(millis() > timeStartClicked + 200){
        buttonClicked = true;
        screen = 4;
      }
    }
  }
  
  if(buttonClicked){
    buttonClick.play();
  }
  
}

void reset(){
  winner = "";
  loser = "";
  Player1.setpos(new PVector(700, 70));
  Player2.setpos(new PVector(70, 430));
  Player1.setlives(6);
  Player2.setlives(6);
  Player1.PlayerBoomerang.resetLoc();
  Player2.PlayerBoomerang.resetLoc();
  currMap.resetTiles();
  Player1.setAllowedUp(true); Player1.setAllowedLeft(true); Player1.setAllowedRight(true); Player1.setAllowedDown(true);
  Player2.setAllowedUp(true); Player2.setAllowedLeft(true); Player2.setAllowedRight(true); Player2.setAllowedDown(true);
}
