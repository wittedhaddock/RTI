int numberOfNodes;
int maxWalkingSpeed;
Node[] atGoogle;
void setup(){
  size(7*161, 700);
  numberOfNodes = 30;
  maxWalkingSpeed = 20; //kilometers per hour
  atGoogle = new Node[numberOfNodes];
  
  for(int nodeIndex = 0; nodeIndex < atGoogle.length; nodeIndex++){
    //Starting positions
    int xCoordinateOfNode = (int)random(0, displayWidth);
    int yCoordinateOfNode = (int)random(0, displayHeight);
    
    //Walking Speed
    int xWalkingSpeedOfNode = (int)random(-1 * maxWalkingSpeed, maxWalkingSpeed);
    int yWalkingSpeedOfNode = (int)random(-1 * maxWalkingSpeed, maxWalkingSpeed);
    
    //Level of Comfort
    int comfortLevelOfNode = (int)random(0, 100);
    
    //Create the node
    atGoogle[nodeIndex] = new Node(xCoordinateOfNode, yCoordinateOfNode, xWalkingSpeedOfNode, yWalkingSpeedOfNode, comfortLevelOfNode);
  }
}

void applyMoveAndDraw(){
  for (Node node: atGoogle){
    node.move();
    node.draw();
  }
}

void draw(){
  background(0);
  applyMoveAndDraw();
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
