int numberOfNodes;
int maxWalkingSpeed;
Node[] atGoogle;
void setup(){
  size(7*161, 700);
  numberOfNodes = 30;
  maxWalkingSpeed = 4; //kilometers per hour
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

void draw(){
  background(100);
  applyMoveAndDraw();
  allowConnectionsAndInteraction();
}

void allowConnectionsAndInteraction(){
  for (Node outerNode: atGoogle){
    for (Node innerNode: atGoogle){
      if (sqrt(pow(outerNode.pX - innerNode.pX, 2) + pow(outerNode.pY - innerNode.pY, 2)) < outerNode.levelOfComfort() + innerNode.levelOfComfort()){ 
        //Make the connection
        stroke(255);
        line(outerNode.pX, outerNode.pY, innerNode.pX, innerNode.pY);
      }   
    }
  }
}

void applyMoveAndDraw(){
  for (Node node: atGoogle){
    node.move();
    node.draw();
  }
}



public class Node extends Object{
  public int pX;
  public int pY;
  public int vX;
  public int vY;
  public int radius;
  
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
  
  public int levelOfComfort(){
    return this.radius;
  }
  
}
