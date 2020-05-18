class Slider {
  //global variables
  private float scaleConstant; //used for scaling the output of the slider value
  private char sliderName; //used to link a slider to the correnct spacial object
  
  //anchor for entire slider's positioning
  private float anchorX;
  private float anchorY;
  
  //slider object dimensions
  private int xSize = 30; 
  private int ySize = 20;
  private int sliderWidth = 250;
  
  //change in x position since starting dragged
  private float dx; 
  
  //current selector box position coordinates
  private float xPos;
  private float yPos;
  
  //temporary store for mouse & box position coordinates
  private float tempMousePosX;
  private float tempBoxPosX; 
  
  private boolean selected = false; //is slider selected by user's mouse
  
  Slider(float yAnchor, float xAnchor, float scaleConstant, char name){
    this.anchorX = xAnchor;
    this.anchorY = yAnchor;
    
    this.yPos = anchorY; //anchor x and y values for both boxes
    this.xPos = anchorX;
    
    this.scaleConstant = scaleConstant;
    this.sliderName = name;
  }
  
  void display(){ //called every frame
    fill(200); //fill = light gray
    rect(anchorX+5, anchorY+8, sliderWidth+20, 5); //draw the slider's back bar
    
    //change the stroke to add a highlighted border if the slider is selected
    if(mouseIsOver()){
      stroke(240);
    } else {
      stroke(100);
    }
    
    //draw the slider's main box
    rect(xPos, yPos, xSize, ySize);
    //draw the slider's character into the box
    fill(50);
    text(this.sliderName, xPos+xSize/2.65, yPos+3*ySize/4);
    
    //reset stroke and fill
    stroke(0);
    fill(100);
  }
  
  boolean mouseIsOver(){ //returns true if mouse is over the slider
    if(pmouseX > (xPos) &&
    pmouseY > (yPos) &&
    pmouseX < (xPos+xSize) &&
    pmouseY < (yPos+ySize)){
      return true;
    } else {
      return false;
    }
  }
  
  void mousePressed(){ //on click
    if(mouseIsOver()){ //box clicked
      tempMousePosX = pmouseX; //Store mouse x pos
      tempBoxPosX = xPos; //Store temporary constant x position
      selected = true; //select this slider for movement
    }
  }
  
  void mouseDragged(){
    if(selected == true){ //if slider selection box is selected by user's mouse
      dx = pmouseX - tempMousePosX; //find difference dragged
      
      //check boundaries
      if((tempBoxPosX+dx)<anchorX){ //lower bound
        xPos = anchorX;
      } else if((tempBoxPosX+dx)>(anchorX+sliderWidth)){
        xPos = anchorX+sliderWidth;
      } else {
        xPos = tempBoxPosX + dx;
      }
    }
  }
  
  void mouseReleased(){
    selected = false; //deselect slider
  }
  
  public float getSlider(){ //getter for slider values
    //set ranges
    float maxPosition = anchorX + float(sliderWidth);
    float minPosition = anchorX;
    float range = maxPosition-minPosition; //range of the slider
    
    float normalisedValue;
    normalisedValue = (xPos-minPosition)/range;
      
    return (normalisedValue * scaleConstant)+100; //return result
  }
}
