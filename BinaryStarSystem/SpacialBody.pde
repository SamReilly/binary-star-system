class SpacialBody{
  //output data
  private float mass;
  private String name;
  private color colour;
  
  //object data
  private float posX, posY;
  private float dia;
  private PVector velocity;
  private PVector acceleration;
  
  public SpacialBody(float mass, String name, color colour, float posX, float posY){
    this.mass = mass;
    this.name = name;
    this.colour = colour;
    this.posX = posX;
    this.posY = posY;
    this.dia = findDiameter();
    this.velocity = PVector.random2D();
    this.acceleration = PVector.random2D().mult(0);
  }
  
  public void setPosition(float X, float Y){
    posX = X;
    posY = Y;
  }
  
  public float getPosX(){
    return this.posX;
  }
  
  public float getPosY(){
    return this.posY;
  }
  
  public void setMass(float mass){
    this.mass = mass;
    this.dia = findDiameter();
  }
  
  public float getMass(){
    return this.mass;
  }
  
  public String getBodyName(){
    return this.name;
  }
  
  private float findDiameter(){
    //TODO: connect diameter to mass
    return 10.0f;
  }
  
  public void setBodyName(String name){
    this.name = name;
  }
  
  public void setColour(color colour){
    this.colour = colour;
  }
  
  public void display(){
    fill(colour);
    
    velocity.add(acceleration); //set the new velocity
    posX+=velocity.x; //set the new position based on the new velocity
    posY+=velocity.y;
    
    ellipse(posX, posY, dia, dia); //draw the point
  }
}
