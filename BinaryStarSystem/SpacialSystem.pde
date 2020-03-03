class SpacialSystem {
  
  private SpacialBody[] bodiesArray;
  private PopulationController popController;
  
  public SpacialSystem(int n){
    popController = new PopulationController(20, 20);
    bodiesArray = new SpacialBody[n];
    for(int i=0; i<n; i++){
      bodiesArray[i] = new SpacialBody(100, "Body", Colour, 100, (i*50)+100);
    }
  }
  
  public void display(){
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].display();
    }
    popController.display();
  }
}
