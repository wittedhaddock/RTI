int numberOfNodes;
int maxWalkingSpeed;
Node[] atGoogle;
void setup(){
  size(7*161, 700);
  numberOfNodes = 400;
  maxWalkingSpeed = 3; //kilometers per hour
  atGoogle = new Node[numberOfNodes];
  
  for(int nodeIndex = 0; nodeIndex < atGoogle.length; nodeIndex++){
    //Starting positions
    int xCoordinateOfNode = (int)random(displayWidth * -2, displayWidth * 2);
    int yCoordinateOfNode = (int)random(displayHeight * -2, displayHeight * 2);
    
    //Walking Speed
    int xWalkingSpeedOfNode = (int)random(-1 * maxWalkingSpeed, maxWalkingSpeed);
    int yWalkingSpeedOfNode = (int)random(-1 * maxWalkingSpeed, maxWalkingSpeed);
    
    //Level of Comfort
    int comfortLevelOfNode = (int)random(0, 200);
    
    //Create the node
    atGoogle[nodeIndex] = new Node(xCoordinateOfNode, yCoordinateOfNode, xWalkingSpeedOfNode, yWalkingSpeedOfNode, comfortLevelOfNode);
  }
}

void draw(){
  background(100);
  applyMoveAndDraw();
  allowConnectionsAndInteraction();
  extrapolateScene();
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

void extrapolateScene(){
  for (Node node: atGoogle){
    if (node.pX > displayWidth * 2 || node.pX < displayWidth * -2 || node.pY > displayHeight * 2 || node.pY < displayHeight * -2){
      
      node.pX = node.pX > displayWidth * 2 ? displayWidth * -2 : node.pX;
      node.pX = node.pX < displayWidth * -2 ? displayWidth * 2 : node.pX;
      
      node.pY = node.pY > displayHeight * 2 ? displayHeight * -2 : node.pY;
      node.pY = node.pY < displayHeight * -2 ? displayHeight * 2 : node.pY;
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
    fill(200, 30, 100);
    stroke(200, 30, 100);
    rect(this.pX - 2, this.pY - 2, 4, 4);
    stroke(255);
  }
  
  public void move(){
    this.pX += this.vX;
    this.pY += this.vY;
  }
  
  public float levelOfComfort(){
    return this.radius/2.0;
  }
  
}
