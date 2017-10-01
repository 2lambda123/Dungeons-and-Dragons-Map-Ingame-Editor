class Box {

  int x, y, sideL;
  boolean obstacle = false;
  char ID;
  
  Box(int x, int y, int sideL) {
    this.x = x;
    this.y = y;
    this.sideL = sideL;
  }

  boolean press() {
    if ((mouseX>x)&&(mouseX < x+sideL)&&(mouseY>y)&&(mouseY< y+sideL)) {
      if (selectLoc){
       // this.distance(characters.get(charID).getBox());
      }
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noFill();
    strokeWeight(10);
    stroke(0, 255, 0);
    //text(ID, x + (sideL/8), y+(sideL));
    rect(this.x, this.y, sideL, sideL);
  }
  
  //int distance(Box charBox){
    
  //}
  
  void setObstacle(){
    if (obstacle){
      obstacle = false;
    } else {
      obstacle = true;
    }
  }
  
  void mark(char symbol){
    
  }
}