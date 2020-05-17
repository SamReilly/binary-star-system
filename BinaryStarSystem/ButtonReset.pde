class ButtonReset extends Button {
  
  ButtonReset(String name, float anchorX, float anchorY){
    super(name, anchorX, anchorY);
  }
  
  void onClick() {
    reset();
  }
  
}
