class Ball {

  //instance variables
  PVector center;
  int xspeed;
  int yspeed;
  int bsize;
  color c;

   //default constructor
   Ball(PVector p, int s) {
     center = new PVector(int(random(bsize/2, width - bsize/2)), int(random(bsize/2, height - bsize/2)));
     bsize = s;
     xspeed = 3;// direction x of ball
     yspeed = 3;//direction y of ball
   }

  boolean collisionCheck(Ball other) {
     float x1 = center.x;
     float y1 = center.y;
     float x2 = other.center.x;
     float y2 = other.center.y;
     // float since the numbers are inclusive of all decimals
     
     float distance = sqrt(pow(x2-x1, 2) + pow(y2 - y1, 2));
     // distance formula to find distance between two centers of circles
     
     return (distance - bsize < 0);
     // the largest possible distance between the two circles is the diameter- otherwise, they won't collide
  }//collisionCheck

  void setColor(color newC) {
    c = newC;
  }//setColor

  //visual behavior
  void display() {
    fill(c);
    circle(center.x, center.y, bsize);
  }//display

  //movement behavior
  void move() {
    if (center.x > width - bsize/2 ||
        center.x < bsize/2) {
        xspeed*= -1;
     }
     if (center.y > height - bsize/2 ||
         center.y < bsize/2) {
         yspeed*= -1;
      }
     center.x+= xspeed;
     center.y+= yspeed;
  }//move

}//Ball
