class Button {
  String name;
  
  float posX; 
  float posY;
  float buttonWidth; 
  float buttonHeight;
  
  Button(String name, float posX, float posY){
    this.name = name;
    this.posX = posX;
    this.posY = posY;
  }
  
  void mousePressed(){
    if(selected()){ //check if this is intended button
      //event to be overridden
      onClick();
    }
  }
  
  void onClick(){
    //method to be overridden
  }
  
  boolean selected(){ //returns true if mouse is over the button
    if(pmouseX > (posX) &&
       pmouseY > (posY) &&
       pmouseX < (posX+buttonWidth) &&
       pmouseY < (posY+buttonHeight))
    {return true;} 
    return false;
  }
  
  void display(){ //called every frame
    buttonHeight = 20;
    buttonWidth = textWidth(name)+10;
    
    fill(200);
    
    if(selected()){
      stroke(240);
    } else {
      stroke(100); 
    }
    
    rect(posX, posY, buttonWidth, buttonHeight);
    
    fill(50);
    text(name, posX+5, posY+(buttonHeight-4));
  }
  
  
}
