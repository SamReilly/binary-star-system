class ButtonToggleName extends Button {
  
  ButtonToggleName(String name, float anchorX, float anchorY){
    super(name, anchorX, anchorY);
  }
  
  void onClick() {
    toggleShowName();
  }
  
}
