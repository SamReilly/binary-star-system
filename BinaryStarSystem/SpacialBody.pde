class SpacialBody{
  //output data
  private float mass;
  private char name;
  private color colour;
  private boolean showName;
  
  //object data
  private float posX, posY;
  private PVector velocity;
  private PVector acceleration;
  private SpacialSystem thisSystem;
  private int frameCounter;
  
  //constructor method
  public SpacialBody(float mass, char name, color colour, float posX, float posY, SpacialSystem thisSystem){
    this.mass = mass;
    this.name = name;
    this.colour = colour;
    this.posX = posX;
    this.posY = posY;
    this.velocity = findStartingVelocity();
    this.acceleration = PVector.random2D().mult(0);
    this.thisSystem = thisSystem;
    this.frameCounter = 0;
  }
  
  //returns direction and velocity to start moving with at the beginning of a scene
  public PVector findStartingVelocity() {
    PVector centre = new PVector(width/2, height/2);
    PVector position = new PVector(this.posX, this.posY);
    PVector relativePosition = position.sub(centre); //find the vector from the position to centre of the screen
    
    relativePosition.normalize().rotate(HALF_PI).mult(1.2);
    return relativePosition;
  }
  
  public void setPosition(float X, float Y){
    posX = X;
    posY = Y;
  }
  
  public void movePosition(PVector shift){
    posX -= shift.x;
    posY -= shift.y;
  }
  
  public float getPosX(){
    return this.posX;
  }
  
  public float getPosY(){
    return this.posY;
  }
  
  public void setMass(float mass){
    this.mass = mass;
  }
  
  public float getMass(){
    return this.mass;
  }
  
  public void display(){ //called every frame
    fill(colour);
    
    velocity.add(acceleration); //set the new velocity
    
    posX+=velocity.x; //set the new position based on the new velocity
    posY+=velocity.y;
    
    ellipse(posX, posY, mass/15, mass/15); //draw the resultant point
    if(showName){
      fill(50);
      text(this.name, posX+5+mass/15, posY-5-mass/15);
    }
    
    if(frameCounter < 18){ //if still counting to target
      frameCounter += 1; //count
    } else {
      frameCounter = 0; //reset the count
      particleController.makeParticle(new PVector(posX, posY)); //Create a particle
    }
  }
  
  //toggles identifiers on and off
  public void toggleShowName(){
    if(!showName){
      this.showName = true;
    } else {
      this.showName = false;
    }
  }
  
  //sets a new acceleration into the global variable
  public void calculateNewAcceleration(PVector COM){ 
    PVector thisCOM = new PVector(COM.x, COM.y); //create new instance of COM vector to not modify main one
    //calculate force vector caused by the centre of mass
    //F = gmm/r^2
    final float g = 1;
    float m1 = this.mass; //find both masses
    float m2 = thisSystem.getSystemMass();
    
    //calculate r
    PVector posVector = new PVector(posX, posY);
    PVector radiusVector = thisCOM.sub(posVector);
    float r = radiusVector.mag();
    
    //calculate F
    float f = (m1*m2*g)/(r*r);
    
    //calculate the acceleration due to that force vector
    float a = f/m1;
    PVector aDirection = PVector.fromAngle(radiusVector.heading());
    drawVector(aDirection);
    
    //set the acceleration vector to global variable
    acceleration = aDirection.mult(a);
  }
  
  //draws a line to indicate a vector on screen
  private void drawVector(PVector input){
    stroke(0);
    line(posX, posY, posX+(input.x*30), posY+(input.y*30));
  }
}
