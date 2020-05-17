class ButtonSetMass extends Button {
  
  ButtonSetMass(String name, float anchorX, float anchorY){
    super(name, anchorX, anchorY);
  }
  
  void onClick() {
    setMasses();
  }
  
}
