int NUM_ROWS = 6;
int NUM_COLS = 18;
int BALL_SIZE = 15;
int PROJECTILE_SIZE = 20;
int Length = 30;
Block[][] grid;
Ball[] BallArray;

int PlatformLength = 200;
int PlatformHeight = 5;
boolean PlatformCanMove = true;
void setup() {
  frameRate(60);
  size(1400, 700);

  newProjectile(PROJECTILE_SIZE);
  grid = new Block[NUM_ROWS][NUM_COLS];
  BallArray = new Ball[100];//how big our array is aka max balls
  makeBlocks(grid);
  drawGrid(grid);
  makeBalls(BallArray,1);
}//setup

void draw() {
  background(200);
  drawGrid(grid);
  
  platform();

 
  BallArray[0].display();
  BallArray[0].move();
  platformMouse();
}//draw


void keyPressed() {
  if (key == ' ') {

  }
}//keyPressed

void newProjectile(int psize) {
  PVector p = new PVector(width/2, height-psize/2);
  
}//newProjectile

void makeBlocks(Block[][] g) {
  int rowWidth = NUM_COLS * Length;
  int widthSpace = width - rowWidth;
  PVector pos = new PVector(widthSpace/2, BALL_SIZE/2);
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      g[r][c] = new Block(pos, color(255,255,255), 30, 20);
      pos.x+=40;
    }//columns
    pos.y+= 25;
    pos.x = widthSpace/2;
  }//rows
}//makeBlocks

void makeBalls(Ball[] BallArr, int Amount) {
  int rowWidth = NUM_COLS * Length;
  for (int i=0; i<Amount; i++) {
    BallArr[i] = new Ball(new PVector(width/2, height), BALL_SIZE);
  }//rows
}//makeBalls
void drawGrid(Block[][] g) {
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      if (g[r][c] != null) {
        g[r][c].display();
      }
    }//columns
  }//rows
}//drawGrid

void processCollisions(Ball p, Ball[][] g) {
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      if (g[r][c] != null && p.collisionCheck(g[r][c])) {
        g[r][c] = null;
        newProjectile(PROJECTILE_SIZE);
      }//collide!
    }//columns
  }//rows
}//processCollisions  

void platform() {
 stroke(0);//outline color
 strokeWeight(5);
 fill(225);
}
void platformMouse() {
 int platformX = mouseX - PlatformLength/2;//follows mouseX coord

 rect(platformX, height - PlatformHeight, PlatformLength, PlatformHeight); 
}
