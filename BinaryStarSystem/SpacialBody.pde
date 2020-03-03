class SpacialBody{
  //output data
  private float mass;
  private String name;
  private color colour;
  
  //object data
  private float posX, posY;
  private float dia;
  
  public SpacialBody(float mass, String name, color colour, float posX, float posY){
    this.mass = mass;
    this.name = name;
    this.colour = colour;
    this.posX = posX;
    this.posY = posY;
    this.dia = findDiameter();
  }
  
  public void setPosition(float X, float Y){
    posX = X;
    posY = Y;
  }
  
  public void setMass(float mass){
    this.mass = mass;
    this.dia = findDiameter();
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
    ellipse(posX, posY, dia, dia); //draw the point
  }
}
