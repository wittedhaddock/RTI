

void setup(){
  
}

void draw(){
  
}

public class Node extends Object{
  int pX;
  int pY;
  int vX;
  int vY;
  int radius;
  
  public Node(int xp, int yp, int xv, int yv, int rad){
    pX = xp;
    pY = yp;
    vX = xv;
    vY = yv;
    radius = rad;
  }
  
  public void draw(){
    fill(0, 30, 200, 100);
    ellipse(this.pX, this.pY, radius, radius);
  }
  
  public void move(){
    this.pX += this.vX;
    this.pY += this.vY;
  }
  
}
