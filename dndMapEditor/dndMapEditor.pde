ArrayList<Character> characters = new ArrayList<Character>();
ArrayList<dndMap> maps = new ArrayList<dndMap>();
ArrayList<PImage> backgrounds = new ArrayList<PImage>();
ArrayList<PImage> icons = new ArrayList<PImage>();
ArrayList<Box> charButtons = new ArrayList<Box>();
int hor = 20, charID = 0, mapID = -1, iconID;
Box[][] boxes;
boolean selectLoc = false, createACharacter = false, selectAOE = false, selectAMap = true, showAOE = false, markIt = false;
Box tempBox, endTempBox;

void setup() {

  size(1000, 1000); 
  backgrounds.add(loadImage("maps/GoblinLairEntrance(20x20).jpg"));
  backgrounds.add(loadImage("maps/GoblinLairMess(20x20).jpg"));
  backgrounds.add(loadImage("maps/GoblinLairStorage(20x20).jpg"));
  backgrounds.add(loadImage("maps/GoblinLairSleepingArea(20x20).jpg"));
  backgrounds.add(loadImage("maps/GoblinLairBossRoom(20x20).jpg"));
  backgrounds.add(loadImage("maps/ForestTrail(20x20).jpg"));
  backgrounds.add(loadImage("maps/Trail(20x20).jpg"));
  backgrounds.add(loadImage("maps/TavernGroundFloor(20x20).jpg"));
  backgrounds.add(loadImage("maps/TrailMap2(20x20).jpg"));
  backgrounds.add(loadImage("maps/TrailMap3(20x20).jpg"));
  backgrounds.add(loadImage("maps/Farm(20x20).jpg"));
  backgrounds.add(loadImage("maps/cliffCityGate(20x20).jpg"));
  backgrounds.add(loadImage("maps/WetLandsEdgeOfLake(20x20).jpg"));
  backgrounds.add(loadImage("maps/FishingSpot(20x20).jpg"));
  backgrounds.add(loadImage("maps/Tavern2ndFloor(20x20).jpg"));
  backgrounds.add(loadImage("maps/CliffCityStreet(20x20).jpg"));
  backgrounds.add(loadImage("maps/HHCentre(20x20) (1).jpg"));
  backgrounds.add(loadImage("maps/JailEscapeHH(20x20).jpg"));



  icons.add(loadImage("characters/firbolg(20x20).jpg"));
  icons.add(loadImage("characters/humanWizard(20x20).jpg"));
  icons.add(loadImage("characters/aarokocra(20x20).jpg"));
  icons.add(loadImage("characters/goblin(20x20).jpg"));
  icons.add(loadImage("characters/goblinBoss(20x20).jpg"));
  icons.add(loadImage("characters/Milo.jpg"));
  icons.add(loadImage("characters/reed.jpg"));
  icons.add(loadImage("characters/crocodile.jpg"));
  icons.add(loadImage("characters/awakenedBush(20x20).png"));
  icons.add(loadImage("characters/dog.jpg"));
  icons.add(loadImage("characters/giant_badger.jpg"));
  icons.add(loadImage("characters/WGenasi.jpg"));
  icons.add(loadImage("characters/Balasar.jpg"));
  icons.add(loadImage("characters/HalfLingGuard.jpg"));
  icons.add(loadImage("characters/HobGoblin.png"));
  icons.add(loadImage("characters/zombie.jpg"));
  icons.add(loadImage("characters/Cade.jpg"));
  icons.add(loadImage("characters/Bandit.jpg"));
  icons.add(loadImage("characters/Yvelda.jpg"));
  icons.add(loadImage("characters/giantRat.jpg"));
  icons.add(loadImage("characters/Cart.png"));
  icons.add(loadImage("characters/Annabelle.jpg"));

  boxes = new Box[20][20];
  for (int i = 0; i < hor; i ++) {
    for (int j= 0; j < hor; j ++) {
      boxes[i][j] = new Box(j*50, i*50, 50);
    }
  }

  for (int i = 0; i < backgrounds.size(); i ++) {
    int j = floor(i/6);
    int k = i;
    while (k >= 6) {
      k -= 6;
    }
    maps.add(new dndMap(backgrounds.get(i), new Box(50+k*150, 50+j*150, 100)));
  }

  for (int i = 0; i < icons.size(); i ++) {
    int j = floor(i/6);
    int k = i;
    while (k >= 6) {
      k -= 6;
    }
    charButtons.add(new Box(50+k*150, 50+j*150, 100));
  }
}

void draw() {
  if (selectAMap) {
    background(150);
    for (int i = 0; i < maps.size(); i ++) {
      maps.get(i).display();
      if (maps.get(i).getBox().press()) {
        maps.get(i).getBox().display();
      }
    }
  } else if (createACharacter) {
    if (!selectLoc) {
      background(150);
      for (int i = 0; i < icons.size(); i ++) {
        int j = floor(i/6);
        int k = i;
        while (k >= 6) {
          k -= 6;
        }
        image(icons.get(i), 50+k*150, 50 + j*150, 100, 100 );
        if (charButtons.get(i).press()) {
          charButtons.get(i).display();
        }
      }
    } else {
      image(maps.get(mapID).getImg(), 0, 0, 1000, 1000);
      for (int i = 0; i < hor; i ++) {
        for (int j = 0; j < hor; j ++) {
          if (boxes[i][j].press()) {
            boxes[i][j].display();
          }
        }
      }
      for (int i = 0; i < characters.size (); i ++) {
        characters.get(i).display();
      }
    }
  } else {
    image(maps.get(mapID).getImg(), 0, 0, 1000, 1000);
    for (int i = 0; i < hor; i ++) {
      for (int j = 0; j < hor; j ++) {
        if (boxes[i][j].press()) {
          boxes[i][j].display();
        }
      }
    }
    for (int i = 0; i < characters.size (); i ++) {
      characters.get(i).display();
    }
    if (showAOE) {
      if (tempBox != null) {
        tempBox.display();
        endTempBox = findBox();
        if (endTempBox != null) {
          int diff = Math.abs(tempBox.x - endTempBox.x);
          for (int i = (tempBox.y-diff)/50; i <= (tempBox.y+diff)/50; i ++) {
            for (int j = (tempBox.x-diff)/50; j <= (tempBox.x+diff)/50; j ++) {
              println(i);
              println(j);
              if ((i <= 19)&&(i >= 0)&&(j<=19)&&(j>=0)) {
                boxes[i][j].display();
              }
            }
          }
        }
      }
    }
  }
}

void selectMap() {
  for (int i= 0; i < maps.size(); i++) {
    if (maps.get(i).getBox().press()) {
      selectAMap = false;
      mapID = i;
    }
  }
}

void selectCharacter() {
  for (int i = 0; i < characters.size(); i ++) {
    if (characters.get(i).box.press()) {
      selectLoc=true;
      charID = i;
      println("character selected");
      println("click on empty block to move.");
    }
  }
}

Box findBox() {
  int q = -1, w =-1;
  for (int i = 0; i < hor; i ++) {
    for (int j = 0; j < hor; j++) {
      if (boxes[i][j].press()) {
        q = i;
        w = j;
      }
    }
  }
  if (q == -1) {
    return null;
  } else {
    return boxes[q][w];
  }
}

void createCharacter() {
  for (int i= 0; i < icons.size(); i++) {
    if (charButtons.get(i).press()) {
      selectLoc = true;
      iconID = i;
    }
  }
}

void mousePressed() {
  if (selectAMap) {
    selectMap();
  } else if (createACharacter) {
    if (!selectLoc) {
      createCharacter();
    } else {
      tempBox = findBox();
      if (tempBox != null) {
        characters.add(new Character(tempBox, icons.get(iconID)));
        createACharacter = false;
        selectLoc = false;
      }
    }
  } else if (selectAOE) {
    if (!selectLoc) {
      tempBox = findBox();
      if (tempBox != null) {
        showAOE = true;
        selectLoc = true;
      }
    } else {
      selectLoc = false;
      selectAOE = false;
      showAOE = false;
    }
  } else {
    if (!selectLoc) {
      selectCharacter();
    } else {
      tempBox = findBox();
      if (tempBox != null) {
        characters.get(charID).setLoc(tempBox);
        selectLoc = false;
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    save("dndMapPresenter/map.png");
    println("saved");
  } else if (key == 'r') {
    selectAMap = true;
    createACharacter = false;
    selectLoc = false;
    characters.clear();
  } else if ((!selectLoc)&&(key == 'a')) {
    selectAOE = true;
  } else if ((selectLoc)&&(key == 'd')) {
    characters.get(charID).die();
    selectLoc = false;
  } else if ((selectLoc)&&(key == 'm')) {
    markIt = true;
    selectLoc = false;
  } else if (markIt){
    characters.get(charID).mark(key);
    markIt = false;
  } //else if ((key == 'h')&&(!selectLoc)) {
    //hiddenMark = true;
  //} 
  else if ((key == 'c')&&(!createACharacter)&&(!selectLoc)) {
    createACharacter = true;
  }
}