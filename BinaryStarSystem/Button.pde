class Button {
  float anchorX, anchorY;
  float boxWidth, boxHeight;
  String name;
  
  Button(String name, float anchorX, float anchorY){
    this.name = name;
    this.anchorX = anchorX;
    this.anchorY = anchorY;
  }
  
  void display(){
    boxHeight = 20;
    boxWidth = textWidth(name)+10;
    
    fill(200);
    
    if(mouseIsOver()){
      stroke(240);
    } else {
      stroke(100); 
    }
    
    rect(anchorX, anchorY, boxWidth, boxHeight);
    
    fill(50);
    text(name, anchorX+5, anchorY+(boxHeight-4));
  }
  
  void mousePressed(){ //trigger event
    if(mouseIsOver()){ //check the mouse is over the button
      //event
    }
  }
  
  boolean mouseIsOver(){ //returns true if mouse is over slider 1
    if(pmouseX > (anchorX) && pmouseY > (anchorY) && pmouseX < (anchorX+boxWidth) && pmouseY < (anchorY+boxHeight)){
      return true;
    } else {
      return false;
    }
  }
}
