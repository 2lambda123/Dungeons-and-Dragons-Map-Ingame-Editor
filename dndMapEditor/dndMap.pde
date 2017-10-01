class dndMap{
  PImage map;
  Box box;
  String title;
  
  dndMap(PImage map, Box box){
    this.map = map;
    this.box = box;
  }
  
  PImage getImg(){
    return map;
  }
  
  Box getBox(){
    return box;
  }
  
  void display(){
    image(map, box.x , box.y , 100, 100 );
  }
  
}