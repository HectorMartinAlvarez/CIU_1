import processing.sound.SoundFile;

SoundFile song;
SoundFile hit;
SoundFile wallhit;
SoundFile score;

float bx = 600;
float by = 400;
float vx = -2;
float angle = 0;

final int W = 5;
final int H = 90;

int px = 100;
int py = 360;
int pP = 0;

int p2x = 1100;
int p2y = 360;
int p2P = 0;

boolean up = false;
boolean down = false;
boolean upP2 = false;
boolean downP2 = false;

boolean pReady = false;
boolean p2Ready = false;

int state = -1;
int second1;
int second2;
boolean timer = true;

boolean menuSelect = true;

void setup(){
  size(1200,900);
  strokeWeight(5);
  song = new SoundFile(this,"sounds/mm3st.wav");
  hit = new SoundFile(this,"sounds/hit.wav");
  wallhit = new  SoundFile(this,"sounds/wallhit.wav");
  score = new SoundFile(this,"sounds/score.wav");
  song.loop(1);
}

void draw(){
  
  stroke(255);

  switch(state){
    case -1:
      mainMenu();
      break;
    case 0:
      preGame();
      break;
    case 1:
      Game();
      break;
  }
  
  controls();
  
  limits();
  
}

void mainMenu(){
  background(0);
  textSize(150);
  textAlign(CENTER);
  text("PONG",600,300);
  textSize(50);
  text("Start",600,500);
  text("Exit",600,600);
  if(menuSelect){
    line(520, 510, 680, 510);
  }else{
    line(540, 610, 660, 610);
  }
  textSize(30);
  textAlign(LEFT);
  text("W - ", 300, height - 50);
  triangle(380,height - 45,395,height-75,410,height - 45);
  text("S - ", 500, height - 50);
  triangle(580,height - 75,595,height-45,610,height - 75);
  text("ENTER - ",700,height - 50); 
  stroke(0, 128, 0);
  line(840,height - 65, 855, height -45);
  line(855, height -45, 890, height -85);
}

void preGame(){
  textAlign(LEFT);
  textSize(40);
  background(0);
  for(int i = 0; i <= 800; i+=200) line(600,i,600,i+100);
  text("Player 1 - ",150,100);
  text("Player 2 - ",750,100);
  noFill();
  strokeWeight(5);
  if(!pReady){
    text("W", px-12,py-45);
    rect(px-25,py-90,59,59);
    text("S", px-7,py+H+75);
    rect(px-25,py+H+30,59,59);
    fill(255);
    triangle(px-15, py-100, px+5, py-130, px+25, py-100);
    triangle(px-15, py+H+100, px+5, py+H+130, px+25, py+H+100);
    stroke(255, 0, 0);
    line(350,60, 390, 110);
    line(350,110, 390, 60);
    text("Z - ",200,height - 50);
    stroke(0, 128, 0);
    line(270,height - 70, 285, height -50);
    line(285, height -50, 330, height - 80);
  }else{
    stroke(0, 128, 0);
    line(350,80, 365, 100);
    line(365,100, 410, 60);
    text("Z - ",200,height - 50);
    stroke(255, 0, 0);
    line(270,height - 80, 310, height -40);
    line(270, height -40, 310, height - 80);
  }
  noFill();
  stroke(255);
  textSize(40);
  if(!p2Ready){
    text("U",p2x-10,p2y-48);
    rect(p2x-25,p2y-90,59,59);
    text("J",p2x,p2y+H+70);
    rect(p2x-25,p2y+H+30,59,59);
    fill(255);
    triangle(p2x-15,p2y-100,p2x+5,p2y-130,p2x+25,p2y-100);
    triangle(p2x-15,p2y+H+100,p2x+5,p2y+H+130,p2x+25,p2y+H+100);
    stroke(255, 0, 0);
    line(950,60, 990, 110);
    line(950,110, 990, 60);
    text("M - ",750,height - 50);
    stroke(0, 128, 0);
    line(830,height - 70, 845, height -50);
    line(845, height -50, 890, height - 80);
  }else{
    stroke(0, 128, 0);
    line(950,80, 965, 100);
    line(965,100, 1010, 60);
    text("M - ",750,height - 50);
    stroke(255, 0, 0);
    line(830,height - 80, 870, height -40);
    line(830, height -40, 870, height - 80);
  }
  stroke(255);
  fill(255);
  if(pReady && p2Ready){
    if(timer){
      second1 = millis();
      second2 = second1 + 5000;
      timer = false;
    }
    text("<--" + round((second2 - second1)*0.001), 300,400); 
    
    if((second2 - second1) <= 0){
      state = 1;
    }else{
     second1 = millis(); 
    }
  }else{
    timer = true;
  }
  Player1();
  Player2();
}

void Game(){
  textSize(80);
  background(0);
  for(int i = 0; i <= 800; i+=200) line(600,i,600,i+100);
  text(pP,280,100);
  text(p2P,900,100);
  ellipse(bx,by,20,20);
  if(bx >= width || bx <= 0){
    score.play(1);
    scored();
    win(pP, 1);
    win(p2P, 2);
  }
  if(by >= height-10 || by <= 10){
    wallhit.play(1);
    angle *= -1;
  }
  bx = bx + vx;
  by = by + angle;
  
  Player1();
  Player2(); 
}

void Player1(){
  rect(px,py,W,H);
  
  if((bx+8 >= px+W && bx-8 <= px+W) && (by+8 >= py && by-8 <= py+H)){
     hit.play(1);  
     if(vx > -10){
       vx *= -1.4;
     }else{
       vx = -vx;
     }
     
     angle = random(-5,5);
  }
}

void Player2(){
  rect(p2x,p2y,W,H);

  if((bx+8 >= p2x-W && bx-8 <= p2x-W) && (by+8 >= p2y && by-8 <= p2y+H)){
     hit.play(1);  
     if(vx < 10){
       vx *= -1.4;
     }else{
       vx = -vx;
     }
     angle = random(-5,5);
  } 
}

void controls(){
  if(up){
    py -= 5;
  }
  if(down){
    py += 5;
  }
  if(upP2){
    p2y -= 5;
  }
  if(downP2){
    p2y += 5;
  }
}

void limits(){
  if(py >= height-H){
    py = height-H+1;
  }
  if(py <= 0){
    py = 1;
  }
  if(p2y >= height-H){
    p2y = height-H+1;
  }
  if(p2y <= 0){
    p2y = 1;
  }
}

void scored(){
  if(bx < 600){
    vx = -2; 
    p2P++;
  }else{
    vx = 2;
    pP++;
  }
  bx = 600;
  by = 400;
}

void win(int points, int player){
  if(points >= 6){
    background(0);
    textSize(120);
    textAlign(CENTER);
    text("Player "+ player +" Wins", 600, 300);
    textSize(60);
    text("R - Restart", 600, 600);
    bx = 0;
    by = 0;
    vx = 0;
    pP = 0;
    p2P = 0;
    px = -10;
    p2x = -10;
    state = 2;
  }
}

void keyPressed() {
  
  if(state == -1){
    switch(key){
      case 'w':
      case 'W':
      case 's':
      case 'S':
        menuSelect = !menuSelect;
        break;
      case ENTER:
        if(menuSelect){
          state = 0;
        }else{
         exit(); 
        }
        break;
    }
  }else if(state < 2){
    switch(key){
      case 'w':
      case 'W':
        up = true;
        break;
      case 's':
      case 'S':
        down = true;
        break;
      case 'u':
      case 'U':
         upP2 = true;
         break;
      case 'j':
      case 'J':
         downP2 = true;
         break;
      case 'z':
      case 'Z':
        pReady = !pReady;
        break;
      case 'm':
      case 'M':
        p2Ready = !p2Ready;
        break;
    }
  }else {
    switch(key){
      case 'r':
      case 'R':
        bx = 600;
        by = 400;
        vx = -2;
        angle = 0;
        
        px = 100;
        py = 360;
        pP = 0;
        
        p2x = 1100;
        p2y = 360;
        p2P = 0;
        
        pReady = false;
        p2Ready = false;
        
        timer = true;

        menuSelect = true;
        state = -1;
    }
  }
}

void mouseMoved() {
  if(state == -1){
     if(mouseX >= 520 && mouseX <= 680 && mouseY <= 510 && mouseY >= 440) {
       menuSelect = true;
     }
     if(mouseX >= 540 && mouseX <= 660 && mouseY <= 610 && mouseY >= 540) {
       menuSelect = false;
     }
  }
}

void mouseClicked() {
  if(state == -1){
     if(mouseX >= 520 && mouseX <= 680 && mouseY <= 510 && mouseY >= 440) {
       state = 0;
     }
     if(mouseX >= 540 && mouseX <= 660 && mouseY <= 610 && mouseY >= 540) {
       exit();
     }
  }
}

void keyReleased() {
  switch(key){
    case 'w':
    case 'W':
      up = false;
      break;
    case 's':
    case 'S':
      down = false;
      break;
    case 'u':
    case 'U':
       upP2 = false;
       break;
    case 'j':
    case 'J':
       downP2 = false;
       break;
    
  }
}
