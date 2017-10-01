PImage img;
Boolean receiving = true, load = true;

void setup(){
  size(1000,1000);
}

void draw(){
  if (!load){
    img = loadImage("map.png");
    background(img);
    load = true;
    println("loaded");
  }
}

void keyPressed(){
  if (key == 'l'){
    load = false;
    println("l fires");
  }
}