class ParticleController {
  public ArrayList<Particle> particleList;
  
  public ParticleController(){
    this.particleList = new ArrayList<Particle>();
  }
  
  public void makeParticle(PVector position) {
    particleList.add(new Particle(position, 80)); //add a new particle with life span of 2 seconds
  }
  
  public void draw() {
    //verify then draw all the particles in the list
    for(int i=0; i<particleList.size(); i++){
      if(particleList.get(i).registerFrame()){
        //register a passing frame, if returns true then delete the particle
        particleList.remove(i);
      }
    }
    
    for(int i=0; i<particleList.size(); i++){
      particleList.get(i).draw();
    }
  }
}
