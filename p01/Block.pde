class Block {
  PVector center;
  int Length;
  int Height;
  color c;
  
   Block(PVector p, color NewColor, int NewLength, int NewHeight) {
     
    Length = NewLength;
    Height = NewHeight;
    center = new PVector(p.x, p.y);
    c = NewColor;
   }

  void display(){
    stroke(0);//outline color
    strokeWeight(1);//outline size
    fill(c);
    rect(center.x,center.y, Length, Height);
  }
}//Ball
