class Troop {
  String type; 
  float x; 
  float y; 
  float xSpd; 
  float ySpd; 
  int cost; 
  int health; 
  int damage;
  float targetX;
  float targetY;
  Troop(float x, float y, String t) {
    this.x = x; 
    this.y = y; 
    type = t;
  }
  Troop(float x, float y, String t, int h, int a) {
    this.x = x; 
    this.y = y; 
    type = t;
    health = h;
    damage = a;
  }
  boolean highlighted() {
    if (highlight) {
      return (dist(x, y, mx, my)<50);
    } else return false;
  }
  //void attack() {
  //}
}
class Button {
  float x; 
  float y; 
  float xSize; 
  float ySize; 
  Button(float x, float y, float xs, float ys) {
    this.x = x; 
    this.y = y; 
    xSize = xs; 
    ySize = ys;
  }
  boolean pressed() {
    return (mouseX>x-xSize/2&&mouseX<x+xSize/2&&mouseY<y+ySize/2&&mouseY>y-ySize/2)&&mousePressed;
  }
  boolean touchingMouse() {
    return mouseX>x-xSize/2&&mouseX<x+xSize/2&&mouseY<y+ySize/2&&mouseY>y-ySize/2;
  }
  void display() {
    rect(x, y, xSize, ySize);
  }
}
String type = "soldier";
boolean start = false;
boolean showHealth = false;
int victory = 0;
String mode = "random";
ArrayList<Troop> troops = new ArrayList();
ArrayList<Troop> enemies = new ArrayList();

Button healthButton = new Button(1650, 850, 75, 75);
Button startButton = new Button(1750, 850, 75, 75);
Button modeButton = new Button(1500, 850, 150, 75);
Button soldierButton = new Button(50, 850, 75, 75);
Button shieldButton = new Button(150, 850, 75, 75);
Button archerButton = new Button(250, 850, 75, 75);
Button summonerButton = new Button(350, 850, 75, 75);
Button chariotButton = new Button(450, 850, 75, 75);
Button cannonButton = new Button(550, 850, 75, 75);
Button wallButton = new Button(650, 850, 75, 75);
PImage grassImg;

void setup() {
  grassImg = loadImage("http://pngimagesfree.com/NATURE/Grass/grass-background-flat-landscape-image.jpg");
  size(1800, 900);
  rectMode(CENTER);
  strokeWeight(5);
  reset();
}
void reset() {
  victory = 0;
  start = false;
  troops.clear();
  enemies.clear();
  if(mode.equals("random")||mode.equals("random battle")) {
    for (int i = 0; i < (int) random(40, 60); i++) {
    Troop enemy = new Troop((int) random(950, 1200), (int) random(0, height-100), "shield");
    enemies.add(enemy);
  }
  for (int i = 0; i < (int) random(10, 20); i++) {
    Troop enemy = new Troop((int) random(950, 1000), (int) random(0, height-100), "wall");
    enemies.add(enemy);
  }
  //for (int i = 0; i < (int) random(2, 4); i++) {
  //  Troop enemy = new Troop((int) random(1100, 1200), (int) random(0, height-100), "chariot");
  //  enemies.add(enemy);
  //}
  for (int i = 0; i < (int) random(60, 80); i++) {
    Troop enemy = new Troop((int) random(1200, 1500), (int) random(0, height-100), "soldier");
    enemies.add(enemy);
  }
  for (int i = 0; i < (int) random(5, 7); i++) {
    Troop enemy = new Troop((int) random(1500, 1800), (int) random(0, height-100), "archer");
    enemies.add(enemy);
  }
  for (int i = 0; i < (int) random(2, 5); i++) {
    Troop enemy = new Troop((int) random(1500, 1800), (int) random(0, height-100), "summoner");
    enemies.add(enemy);
  }
  for (int i = 0; i < (int) random(2, 3); i++) {
    Troop enemy = new Troop((int) random(1500, 1800), (int) random(0, height-100), "cannon");
    enemies.add(enemy);
  }
  //for (int i = 0; i < 25; i++) {
  //  Troop enemy = new Troop((int) random(0, 500), (int) random(0, height-100), "cannon");
  //  troops.add(enemy);
  //}
  } else if(mode.equals("sandbox")) {
  }
  if(mode.equals("random battle")) {
      for (int i = 0; i < (int) random(40, 60); i++) {
        Troop enemy = new Troop((int) random(600, 850), (int) random(0, height-100), "shield");
        troops.add(enemy);
      }
      for (int i = 0; i < (int) random(10, 20); i++) {
        Troop enemy = new Troop((int) random(800, 850), (int) random(0, height-100), "wall");
        troops.add(enemy);
      }
      //for (int i = 0; i < (int) random(2, 4); i++) {
      //  Troop enemy = new Troop((int) random(1100, 1200), (int) random(0, height-100), "chariot");
      //  enemies.add(enemy);
      //}
      for (int i = 0; i < (int) random(60, 80); i++) {
        Troop enemy = new Troop((int) random(300, 600), (int) random(0, height-100), "soldier");
        troops.add(enemy);
      }
      for (int i = 0; i < (int) random(5, 7); i++) {
        Troop enemy = new Troop((int) random(0, 300), (int) random(0, height-100), "archer");
        troops.add(enemy);
      }
      for (int i = 0; i < (int) random(2, 5); i++) {
        Troop enemy = new Troop((int) random(0, 300), (int) random(0, height-100), "summoner");
        troops.add(enemy);
      }
      for (int i = 0; i < (int) random(2, 3); i++) {
        Troop enemy = new Troop((int) random(0, 300), (int) random(0, height-100), "cannon");
        troops.add(enemy);
      }
  }
}
void draw() {
  background(255);
  imageMode(CORNER);
  image(grassImg, 0, 0);
  image(grassImg, width/2, 0);
  fill(128);
  noStroke();
  rectMode(CORNER);
  rect(0, 800, width, 100);
  rectMode(CENTER);
  stroke(0);
  drawTroops(troops, "blue");
  drawTroops(enemies, "red");
  drawTroopButtons();
  fill(0);
  text("Cost: $" + cost(troops), width/2, 850);
  text("Enemy Cost: $" + cost(enemies), width/2+200, 850);
  victory();
  if (start) {
    movement(troops, enemies);
    movement(enemies, troops);
    death(troops);
    death(enemies);
    if(showHealth) {
      drawHealth(troops);
      drawHealth(enemies);
    }
  }
  if (frameCount%10==0) {
    attack(troops, enemies);
    attack(enemies, troops);
  }
  if (!start) fill(0, 255, 0); 
  else fill(255, 0, 0);
  startButton.display();
  if (!start) {
    stats(troops);
    stats(enemies);
  }
  if(showHealth) fill(255, 0, 0);
  else fill(0, 255, 0);
  healthButton.display();
  fill(128);
  modeButton.display();
  if(modeButton.touchingMouse()) {
    fill(255);
    textSize(20);
    text(mode, 1455, 850);
  }
  if (start) {
    if (troops.size()==0||enemies.size()==0) {
      if (troops.size()==0) {
        victory = -1;
      } else victory = 1;

      start = false;
    }
  }
  if(mousePressed&&mouseButton==RIGHT) {
    if(frameCount%3 ==0) {
      if(mode.equals("random")) {
        if (mouseY<800&&mouseX<width/2&&!start) {
          Troop temp = new Troop(mouseX, mouseY, type);
          troops.add(temp);
        }
      } else if(mode.equals("sandbox")) {
        if (mouseY<800&&mouseX<width/2&&!start) {
          Troop temp = new Troop(mouseX, mouseY, type);
          troops.add(temp);
        } else if (mouseY<800&&mouseX>width/2&&!start) {
          Troop temp = new Troop(mouseX, mouseY, type);
          enemies.add(temp);
        }
      }
    }
  }

}
float mx = 0;
float my = 0;
boolean highlight;
void mousePressed() {
  if(mouseButton==LEFT) {
    if(mode.equals("random")) {
      if (mouseY<800&&mouseX<width/2&&!start) {
        Troop temp = new Troop(mouseX, mouseY, type);
        troops.add(temp);
      }
    } else if(mode.equals("sandbox")) {
      if (mouseY<800&&mouseX<width/2&&!start) {
        Troop temp = new Troop(mouseX, mouseY, type);
        troops.add(temp);
      } else if (mouseY<800&&mouseX>width/2&&!start) {
        Troop temp = new Troop(mouseX, mouseY, type);
        enemies.add(temp);
      }
    }
  }
  //if (highlight&&start) {
  //  tx=mouseX;
  //  ty=mouseY;
  //  highlight = false;
  //}
}
void mouseReleased() {
  if(victory!=0) {
    reset();
  }
  if(showHealth) fill(0, 255, 0);
  else fill(255, 0, 0);
  if(healthButton.touchingMouse()) {
    showHealth = !showHealth;
  }  
  if(modeButton.touchingMouse()) {
    if(mode.equals("random")) mode = "sandbox";
    else if(mode.equals("sandbox")) mode = "random battle";
    else if(mode.equals("random battle")) mode = "random";
    reset();
  }  
  if (startButton.touchingMouse()) {
    if(start) reset();
    else start = true;
  }
}
void keyPressed() {
  if(key == ' ') {
      if(mode.equals("random")) {
        if (mouseY<800&&mouseX<width/2&&!start) {
          Troop temp = new Troop(mouseX, mouseY, type);
          troops.add(temp);
        }
      } else if(mode.equals("sandbox")) {
        if (mouseY<800&&mouseX<width/2&&!start) { 
          Troop temp = new Troop(mouseX, mouseY, type);
          troops.add(temp);
        } else if (mouseY<800&&mouseX>width/2&&!start) {
          Troop temp = new Troop(mouseX, mouseY, type);
          enemies.add(temp);
        }
      }
  }
}
float tx;
float ty;
void drawTroops(ArrayList<Troop> x, String clr) {
  for (int i = 0; i <  x.size(); i++) {
    if (clr.equals("blue")) {
      fill(0, 0, 255, 100);
    } else if (clr.equals("red")) {
      fill(255, 0, 0, 100);
    }
    if (x.get(i).type.equals("soldier")) {
      ellipse(x.get(i).x, x.get(i).y, 25, 25);
    }
    if (x.get(i).type.equals("shield")) {
      rect(x.get(i).x, x.get(i).y, 25, 25);
    }
    if (x.get(i).type.equals("archer")) {
      triangle(x.get(i).x, x.get(i).y-25, x.get(i).x-20, x.get(i).y+10, x.get(i).x+20, x.get(i).y+10);
    }
    if (x.get(i).type.equals("arrow")) {
      ellipse(x.get(i).x, x.get(i).y, 10, 10);
    }
    if (x.get(i).type.equals("cannonball")) {
      ellipse(x.get(i).x, x.get(i).y, 30, 30);
    }
    if (x.get(i).type.equals("summoner")) {
      quad(x.get(i).x+10, x.get(i).y-25, x.get(i).x-10, x.get(i).y-25, x.get(i).x-20, x.get(i).y+10, x.get(i).x+20, x.get(i).y+10);
    }
    if (x.get(i).type.equals("chariot")) {
      rect(x.get(i).x, x.get(i).y, 30, 20);
    }
    if (x.get(i).type.equals("wall")) {
      rect(x.get(i).x, x.get(i).y, 50, 50);
    }
    if(x.get(i).type.equals("cannon")) {
      translate(x.get(i).x, x.get(i).y);
      rotate(calculateAngle(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY));
      rectMode(CENTER);
      rect(20, 0, 40, 20);
      resetMatrix();
      if(clr.equals("blue")) fill(0, 0, 255);
      else fill(255, 0, 0);

      ellipse(x.get(i).x, x.get(i).y, 40, 40);
    }
  }
}
float calculateAngle(float x, float y, float x2, float y2) {
  float xDist = x2-x;
  float yDist = y2-y;
  return atan2(yDist, xDist);
}
void movement(ArrayList<Troop> x, ArrayList<Troop> y) {
  Troop min = new Troop(-2000000000, -2000000000, "none");
  for (int i = 0; i < x.size(); i++) {
    for (int r = 0; r < y.size(); r++) {
        if(y.get(r).type.equals("arrow")||y.get(r).type.equals("cannonball")) break;
      if (dist(x.get(i).x, x.get(i).y, mx, my)<200&&ty!=0&&tx!=0) {
        for (int o = 0; o < dist(x.get(i).x, x.get(i).y, tx, ty); o++) {
          x.get(i).targetX = tx;
          x.get(i).targetY = ty;
        }
      } else if (Math.min(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y), (dist(x.get(i).x, x.get(i).y, min.x, min.y)))==(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y))) {
        min = y.get(r);
        x.get(i).targetX = min.x;
        x.get(i).targetY = min.y;
      }
    }
    x.get(i).x+=x.get(i).xSpd;
    x.get(i).y+=x.get(i).ySpd;

    if (x.get(i).type.equals("soldier")) {
      x.get(i).xSpd = -(x.get(i).x-x.get(i).targetX)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)/3);
      x.get(i).ySpd = -(x.get(i).y-x.get(i).targetY)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)/3);
      if(x.get(i).health < maxHp.get("soldier")) {
        x.get(i).health+=3;
      }
    } else if (x.get(i).type.equals("shield")) {
      x.get(i).xSpd = -(x.get(i).x-x.get(i).targetX)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY));
      x.get(i).ySpd = -(x.get(i).y-x.get(i).targetY)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY));
    } else if (x.get(i).type.equals("archer")) {
      x.get(i).xSpd = -(x.get(i).x-x.get(i).targetX)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*2);
      x.get(i).ySpd = -(x.get(i).y-x.get(i).targetY)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*2);
      if (dist(x.get(i).x, x.get(i).y, min.x, min.y)<500) {
        x.get(i).xSpd = 0;
        x.get(i).ySpd = 0;
      }
    } else if (x.get(i).type.equals("arrow")) {
    //   x.get(i).xSpd = -(x.get(i).x-min.x)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/4);
    //   x.get(i).ySpd = -(x.get(i).y-min.y)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/4);
    } else if (x.get(i).type.equals("summoner")) {
      x.get(i).xSpd = -(x.get(i).x-x.get(i).targetX)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*2);
      x.get(i).ySpd = -(x.get(i).y-x.get(i).targetY)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*2);
      if (dist(x.get(i).x, x.get(i).y, min.x, min.y)<400) {
        x.get(i).xSpd = 0;
        x.get(i).ySpd = 0;
      }
    } else if (x.get(i).type.equals("chariot")) {
      if (frameCount%30==0) {
        x.get(i).xSpd = -(x.get(i).x-min.x)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/7);
        x.get(i).ySpd = -(x.get(i).y-min.y)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/5);
      }
    }
    else if (x.get(i).type.equals("cannon")) {
      x.get(i).xSpd = -(x.get(i).x-x.get(i).targetX)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*3);
      x.get(i).ySpd = -(x.get(i).y-x.get(i).targetY)/(dist(x.get(i).x, x.get(i).y, x.get(i).targetX, x.get(i).targetY)*3);
      if (dist(x.get(i).x, x.get(i).y, min.x, min.y)<600) {
        x.get(i).xSpd = 0;
        x.get(i).ySpd = 0;
      }
    } else if (x.get(i).type.equals("wall")) {
        x.get(i).xSpd = 0;
        x.get(i).ySpd = 0;
    }
    if(x.get(i).type.equals("arrow")||x.get(i).type.equals("cannonball")) {
        if(x.get(i).x > width || x.get(i).x < 0 || x.get(i).y > height-100 || x.get(i).y < 0) {
            x.remove(i);
        }
    }else if (x.get(i).type.equals("chariot")) {
      if (frameCount%30==0) {
        x.get(i).xSpd = -(x.get(i).x-min.x)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/7);
        x.get(i).ySpd = -(x.get(i).y-min.y)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/5);
      }
    }
  }
  for (int i = 0; i < x.size(); i++) {
    for (int r = 0; r < x.size(); r++) {
      if (!x.get(i).type.equals("arrow")&&!x.get(i).type.equals("cannonball")&&!x.get(i).type.equals("wall")) {
        if (dist(x.get(i).x, x.get(i).y, x.get(r).x, x.get(r).y)<30&&dist(x.get(i).x, x.get(i).y, x.get(r).x, x.get(r).y)!=0) {
          x.get(i).xSpd += (int) random(-3, 3);
          x.get(i).ySpd += (int) random(-3, 3);
        }
      }
    }
  }
  for (int i = 0; i < x.size(); i++) {
    for (int r = 0; r < y.size(); r++) {
      if (!x.get(i).type.equals("arrow")&&!x.get(i).type.equals("chariot")&&!x.get(i).type.equals("cannonball")) {
        if (dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y)<30) {
          x.get(i).xSpd *= (int) random(-2, -1);
          x.get(i).ySpd *= (int) random(-2, -1);
        }
      }
    }
  }
}

void attack(ArrayList<Troop> x, ArrayList<Troop> y) {
  for (int i = 0; i < x.size(); i++) {
    if (!x.get(i).type.equals("archer")) {
      for (int r = 0; r < y.size(); r++) {
        if (x.get(i).equals("chariot")&&dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y)<50) {
          y.get(r).health-=x.get(i).damage;
        } else if (dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y)<40) {
          if(x.get(i).type.equals("wall")&&y.get(r).type.equals("arrow")||x.get(i).type.equals("arrow")&&y.get(r).type.equals("wall")) {
            y.get(r).health-=30;
            x.get(i).health-=30;
          }
          else if(x.get(i).type.equals("wall")&&y.get(r).type.equals("cannonball")||x.get(i).type.equals("cannonball")&&y.get(r).type.equals("wall")) {
            y.get(r).health-=1000;
            x.get(i).health-=1000;
          }
          else if(x.get(i).type.equals("shield")&&y.get(r).type.equals("arrow")||x.get(i).type.equals("arrow")&&y.get(r).type.equals("shield")) {
            y.get(r).health-=50;
            x.get(i).health-=50;
          }
          else if(x.get(i).type.equals("shield")&&y.get(r).type.equals("cannonball")||x.get(i).type.equals("cannonball")&&y.get(r).type.equals("shield")) {
            y.get(r).health-=1;
            x.get(i).health-=1;
          }
          else {
            y.get(r).health-=x.get(i).damage;
            x.get(i).health-=y.get(r).damage;
          }
        }
      }
    }
    if (x.get(i).type.equals("archer")) {
      if (frameCount%90==0&&start) {
        Troop temp = new Troop(x.get(i).x, x.get(i).y, "arrow", 1, (int) random(500, 750));
        Troop min = new Troop(-2000000000, -2000000000, "none");
        for (int r = 0; r < y.size(); r++) {
            if(y.get(r).type.equals("cannonball")||y.get(r).type.equals("arrow")) break;
          if (dist(x.get(i).x, x.get(i).y, mx, my)<200&&ty!=0&&tx!=0) {
            for (int o = 0; o < dist(x.get(i).x, x.get(i).y, tx, ty); o++) {
              x.get(i).targetX = tx;
              x.get(i).targetY = ty;
            }
          } else if (Math.min(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y), (dist(x.get(i).x, x.get(i).y, min.x, min.y)))==(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y))) {
            min = y.get(r);
            x.get(i).targetX = min.x;
            x.get(i).targetY = min.y;
          } 
        }
        temp.xSpd = -(x.get(i).x-min.x)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/6);
        temp.ySpd = -(x.get(i).y-min.y)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/6);
        x.add(temp);
      }
    }
    if (x.get(i).type.equals("cannon")) {
      if (frameCount%240==0&&start) {
        Troop temp = new Troop(x.get(i).x, x.get(i).y, "cannonball", 1, 3000);
        Troop min = new Troop(-2000000000, -2000000000, "none");
        for (int r = 0; r < y.size(); r++) {
            if(y.get(r).type.equals("cannonball")||y.get(r).type.equals("arrow")) break;
          if (dist(x.get(i).x, x.get(i).y, mx, my)<200&&ty!=0&&tx!=0) {
            for (int o = 0; o < dist(x.get(i).x, x.get(i).y, tx, ty); o++) {
              x.get(i).targetX = tx;
              x.get(i).targetY = ty;
            }
          } else if (Math.min(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y), (dist(x.get(i).x, x.get(i).y, min.x, min.y)))==(dist(x.get(i).x, x.get(i).y, y.get(r).x, y.get(r).y))) {
            min = y.get(r);
            x.get(i).targetX = min.x;
            x.get(i).targetY = min.y;
          } 
        }
        temp.xSpd = -(x.get(i).x-min.x)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/8);
        temp.ySpd = -(x.get(i).y-min.y)/(dist(x.get(i).x, x.get(i).y, min.x, min.y)/8);
        x.add(temp);
      }
    }
    if (x.get(i).type.equals("summoner")) {
      if (frameCount%120==0&&start) {
        Troop temp = new Troop(x.get(i).x, x.get(i).y, "soldier", 1500, (int) random(15, 20));
        x.add(temp);
      }
      if (frameCount%180==0&&start) {
        for (int r = 0; r < (int) random(0, 2); r++) {
          Troop temp = new Troop(x.get(i).x+random(-100, 100), x.get(i).y+random(-100, 100), "soldier", 3000, (int) random(10, 14));
          x.add(temp);
        }
      }
      if (frameCount%360==0&&start) {
        Troop temp = new Troop(x.get(i).x+random(-100, 100), x.get(i).y+random(-100, 100), "shield", 4000, (int) random(7, 12));
        x.add(temp);
      }
    }
  }
}
void drawHealth(ArrayList<Troop> x) {
  for(int i = 0; i < x.size(); i++) {
    Troop temp = x.get(i);
    if(!temp.type.equals("arrow")&&!temp.type.equals("cannonball")) {
      strokeWeight(7);
      //colorMode(HSB);
      //stroke((int)temp.health/maxHp.get(temp.type)*60, 255, 255);
      stroke(128);
      line(temp.x-maxHp.get(temp.type)/200,temp.y - 30, temp.x+maxHp.get(temp.type)/200, temp.y - 30);
      stroke(255-temp.health/20, temp.health/20, 0);
      line(temp.x-maxHp.get(temp.type)/200,temp.y - 30, temp.x-maxHp.get(temp.type)/200+temp.health/100, temp.y - 30);
      colorMode(RGB);
      stroke(0);
      strokeWeight(5);
    }
  }
}
void drawTroopButtons() {
  fill(0);
  textSize(30);
  if (soldierButton.touchingMouse()) {
    text("Soldier", 12.5, 800);
  }
  if (shieldButton.touchingMouse()) {
    text("Shield", 112.5, 800);
  }
  if (archerButton.touchingMouse()) {
    text("Archer", 212.5, 800);
  }
  if (summonerButton.touchingMouse()) {
    text("Summoner", 312.5, 800);
  }
  if (chariotButton.touchingMouse()) {
    text("Chariot", 412.5, 800);
  }
  if (cannonButton.touchingMouse()) {
    text("Cannon", 512.5, 800);
  }
  if (wallButton.touchingMouse()) {
    text("Wall", 612.5, 800);
  }
  
  if (soldierButton.pressed())type = "soldier";
  if (shieldButton.pressed())type = "shield";
  if (archerButton.pressed())type = "archer";
  if (summonerButton.pressed())type = "summoner";
  if (chariotButton.pressed())type = "chariot";
  if (cannonButton.pressed())type = "cannon";
  if (wallButton.pressed())type = "wall";
  fill(255);
  soldierButton.display();
  fill(0, 0, 255, 100);
  ellipse(50, 850, 50, 50);
  fill(255);
  shieldButton.display();
  fill(0, 0, 255, 100);
  rect(150, 850, 50, 50);
  fill(255);
  archerButton.display();
  fill(0, 0, 255, 100);
  triangle(250, 825, 225, 875, 275, 875);
  fill(255);
  summonerButton.display();
  fill(0, 0, 255, 100);
  quad(370, 825, 330, 825, 325, 875, 375, 875);
  fill(255);
  chariotButton.display();
  fill(0, 0, 255, 100);
  rect(450, 850, 60, 40);
  fill(255);
  cannonButton.display();
  fill(0, 0, 255, 100);
  ellipse(550, 850, 70, 70);
  fill(255);
  wallButton.display();
  fill(0, 0, 255, 100);
  rect(650, 850, 70, 70);
  fill(255);
}
HashMap<String, Integer> maxHp = new HashMap();
void stats(ArrayList<Troop> x) {
  for (int i = 0; i < x.size(); i++) {
    if (x.get(i).type.equals("soldier")) {
      x.get(i).cost = 10;
      x.get(i).health = 4000;
      maxHp.put("soldier", 4000);
      x.get(i).damage = (int) random(25, 30);
    }
    if (x.get(i).type.equals("shield")) {
      x.get(i).cost = 20;
      x.get(i).health = 6000;
      x.get(i).damage = (int) random(10, 15);
      maxHp.put("shield", 6000);
    }
    if (x.get(i).type.equals("archer")) {
      x.get(i).cost = 30;
      x.get(i).health = 500;
      x.get(i).damage = 1;
      maxHp.put("archer", 500);
    }
    if (x.get(i).type.equals("summoner")) {
      x.get(i).cost = 50;
      x.get(i).health = 5000;
      x.get(i).damage = 1;
      maxHp.put("summoner", 5000);
    }
    if (x.get(i).type.equals("chariot")) {
      x.get(i).cost = 150;
      x.get(i).health = 6000;
      maxHp.put("chariot", 6000);
      x.get(i).damage = 400;
    }
    if (x.get(i).type.equals("cannon")) {
      x.get(i).cost = 250;
      x.get(i).health = 2000;
      maxHp.put("cannon", 2000);
      x.get(i).damage = 1;
    }
    if (x.get(i).type.equals("wall")) {
      x.get(i).cost = 70;
      x.get(i).health = 20000;
      maxHp.put("wall", 20000);
      x.get(i).damage = 1;
    }
  }
}
int cost(ArrayList<Troop> x) {
  int cost = 0;
  for (int i = 0; i < x.size(); i++) {
    cost+=x.get(i).cost;
  }
  return cost;
}
void victory() {
  String text = "";
  fill(0);
  rectMode(CENTER);
  if(victory!=0) {
    rect(width/2, height/2-44, width, 100);
  }
  if (victory == 1) text = "Victory!";
  else if (victory == -1) text = "Defeat";
  textSize(72);
  if (victory == 1) fill(0, 255, 0);
  else if (victory == -1) fill(255, 0, 0);
  textMode(CENTER);
  text(text, width/2-144, height/2);
}
void death(ArrayList<Troop> x) {
  for (int i = 0; i < x.size(); i++) {
    if (x.get(i).health<1) {
        if(x.get(i).type.equals("summoner")) {
            for(int r = 0; r < 5; r++) {
                Troop temp = new Troop(x.get(i).x+random(-200, 200), x.get(i).y+random(-200, 200), "soldier", 1000, (int) random(10, 15));
                x.add(temp);
                Troop temp2 = new Troop(x.get(i).x+random(-200, 100), x.get(i).y+random(-200, 100), "shield", 7000, (int) random(8, 12));
                x.add(temp2);
            }
        }
        if(x.get(i).type.equals("cannonball")||x.get(i).type.equals("wall")) {
          ArrayList<Troop> temp = new ArrayList();
          if(x.equals(enemies)) {
            temp = troops;
          } else {
            temp = enemies;
          }
          for(int r = 0; r < temp.size(); r++) {
            if(dist(x.get(i).x, x.get(i).y, temp.get(r).x, temp.get(r).y)<125) {
                if(x.equals(troops)) fill(0, 0, 255, 2);
                else fill(255, 0, 0, 2);
              ellipse(x.get(i).x, x.get(i).y, 125, 125);
              if(x.get(i).type.equals("cannonball")) {
                if(temp.get(r).type.equals("shield")) {
                  temp.get(r).health -= 400;
                } else {
                  temp.get(r).health -= 2000;
                }
              } else if(x.get(i).type.equals("wall")) {
                temp.get(r).health -= 250;
              }
            //   println("hi");
            }
          } if(x.get(i).type.equals("wall")) {
              for(int r = 0; r < 2; r++) {
                Troop temp2 = new Troop(x.get(i).x+random(-200, 100), x.get(i).y+random(-200, 100), "shield", 5000, (int) random(8, 12));
                x.add(temp2);
            }
          }
        }
        x.remove(i);
    }
  }
}