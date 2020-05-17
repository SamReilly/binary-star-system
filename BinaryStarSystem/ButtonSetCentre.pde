class ButtonSetCentre extends Button {
  
  ButtonSetCentre(String name, float anchorX, float anchorY){
    super(name, anchorX, anchorY);
  }
  
  void onClick() {
    toggleCentre(); //toggles on and off the camera follow function on the center of mass point
  }
  
}
