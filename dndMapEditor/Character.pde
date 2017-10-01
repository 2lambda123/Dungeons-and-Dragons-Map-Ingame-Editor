class Character {
  Box box;
  PImage img;
  boolean dead = false;
  char ID = ' ';

  Character(Box box, PImage img) {
    this.box = box;
    this.img = img;
  }

  void setLoc(Box box) {
    this.box = box;
  } 
  
  Box getBox(){
    return box;
  }
  
  PImage getImg(){
    return img;
  }

  void display() {
    imageMode(CENTER);
    image(img, box.x+(box.sideL/2), box.y+(box.sideL/2));
    fill(0,255,0);
    //println(ID);
    textSize(30);
    fill(255,0,0);
    text(ID, box.x + (box.sideL/8), box.y+(box.sideL));
    imageMode(CORNER);
    if (dead == true){
      fill(0,255,0);
      strokeWeight(5);
      line(box.x, box.y, box.x+box.sideL, box.y+box.sideL);
      line(box.x+box.sideL, box.y, box.x, box.y+box.sideL);
    }
  }
  
  void die(){
    dead = true;
  }
  
  void mark(char theMark){
    ID = theMark;
  }
}