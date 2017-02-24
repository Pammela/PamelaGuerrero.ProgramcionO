//CLICK IN THE SCREEN
//PRESS 1,CHARACTER
//PRESS 2 STRART GAME/ X TO QUICK
//ANY KEY TO COMEBACK TO THE MAIN MENU :)
//
final int stateMenu = 0;
final int Characterr = 1;
final int Sgame = 2;
int state = stateMenu;
/////////////////////////////////////////////////////////////////////////////////////
//GAME
//YOU vs Enemy(it's gonna catch u)
//CONTROLS FOR HEROSPRITE left/right and up to run
//SHOOT (space bar) TO END LIFE OF ENEMY
Sprite s;
Enemy e;
Bullet b;
boolean left, right,up, down,space;
int lives,score;
////////////////////////////////////////////////////////////////////////////////////////
PGraphics HI; 
PGraphics CROW;
PGraphics FIGHT;
PGraphics KOI;
// font

PFont font;

// main functions

void setup(){
  background (1);
  // runs only once
  size(1000, 500);
  smooth();
  font = createFont("hi-48", 14);
  textFont(font);
  //
//CHARACTERS
  HI = createGraphics (150,150);
  CROW = createGraphics (150,150);
  FIGHT= createGraphics(550,550);
  KOI = createGraphics (100,200);
 //
 
//GAME---------------------
  s= new Sprite();
  e= new Enemy();
  b= new Bullet();
  left =false;
  right= false;
  up= false;
  down= false;
  space=false;
  //


  
} 
//
void draw(){
  switch (state) {
  case stateMenu:
    showMenu();
    break;
  case Characterr:
    hCharacterr();
    dibujoHI();
    CROW();
    KOI();
    break;
  case Sgame:
    hSgame();
    KOI2();
    HI2();
    FIGHT();
    showme();
    
    break;
  } 
} 
// keyboard functions
void keyPressed() {
  switch (state) {
  case stateMenu:
    keyStateMenu();
    break;
  case Characterr:
    keyCharacterr();
    break;
  case Sgame:
    keySgame();
    break;
    default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
    
  }
  switch(keyCode){
     case 37://left
    left=true;
    break; case 39://right
    right=true;
    break; case 38://up
    up=true;
    break; case 40://down
    down=true;
    
    break; case 32://space
    space=true;
    break;
  }
} 
//
void keyStateMenu() {
  //
  switch(key) {
  case '1':
    state = Characterr;
    break;
  case '2':
    state = Sgame;
    break;
  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    break;
  }
} 
//
void keyCharacterr() {
  // any key is possible
  switch(key) {
 case'b':
    state = stateMenu;
    break;
  } 
} 
//---
void keySgame(){
  // any key is possible
  switch(key) {
    case'b':
    state = stateMenu;
    break;
  }
} 
//--
//
void showMenu() {
  background (1);
  //------
  textSize(80);
  fill(173,50,random(245));
  text(" PζИG ", 130, 200, 3);
  
  textSize(14);
  textAlign(CENTER);
  fill(203,random(280),255);
  text("☆ ßOИИY L∂SS ☆", 250, 240);//1
  text("☆ SŦ∂RŦ G∂MЭ ☆",250,260);//2
  //
  textAlign(LEFT);
  text("→ back menu (b)  ", 180, 320);//b
  text("→ to quit (x)  ", 180, 340);//x
  
} 
//
void hCharacterr() {
  background (212, 186, 235); 
  fill(1);
  rect(150,90,710,170,10,10,10,10);
  noStroke();
  fill(1,100);
  rect(100,350,200,500,100);
  rect(700,-250,80,300,100);
  //
  textSize(50);
  fill(random(264),103,253);
  text(" ßOИИY L∂SS ", 320, 80, 5);
  fill(#DC92ED);
  textSize(14);
  text("THE GIRL POWER IS HERE", 400, 110);
  fill(#EFC0FA);
  text("(○｀д´)ﾉｼ Σ(っﾟДﾟ)っ",420,140);
  fill(#C792ED);
  text("This little, fabulous and rare girls who try to defeat KOI, he is a devil entity who try to steal the life of others.",180,170);
  text("Help them to fight KOI and free them from evil ƪ(`▿▿▿▿´ƪ)",310,190);
  text("Use the ← ↑ → to move and space to (　-_･) ︻デ═一 ▸ your magic powers. Don't let be caught.", 210,210);
  fill(203,random(280),255);
  text("→ back menu (b)  ", 780, 480);//b
  fill(203,280,255);
   
} 
//
void hSgame(){
  background (255,203,203);
  textSize(14);
  fill(203,random(280),255);
  text("→ back menu (b)  ", 780, 480);//b
  //textSize(50);
  //fill(255,135,175);
  //text("", 430, 80, 5);
} 
//
//////////////////////////////////////////////////////////////////////////////////
///----GAMEEE-----
void showme(){
 s.update();
  s.display();
  e.update(s);
  e.display();
  b.update();
  b.display();
  
  if(rectangleIntersect(s,e)){
    fill(234,255,125);
    rect(0,0,width,height);
    removeLife();
  }
  if(space){
   b.setStarLocation(s.xx,s.yy,s.rotation);
  }
  if(rectangleIntersect(b,e)){
    fill(200,115,189,0);
    rect(0,0,width,height);
    addScore();
  }
  fill(178,165,229);
 text("LOSING: "+lives +"\nSHOOTING KOI: "+score,100,400); 
 fill(218,255,114);
 ellipse(93,395,10,10);
 fill(255,81,104);
 ellipse(93,417,10,10);
}

//------------------
void removeLife(){
  lives++;
  s.die();
  e.reset();
}
void addScore(){
  score++;
  e.die();
  b.reset();
}
//------------
boolean rectangleIntersect(Sprite r1, Enemy r2){
  //distance apart xx-axis and yy-axis
  float distanceX=(r1.xx)- (r2.xx);
  float distanceY= (r1.yy)- (r2.yy);
  //combined half w/h
  float combineHalfW= r1.w/2 + r2.w/2;
  float combineHalfH= r1.h/2 + r2.h/2;
  //intersection x-axis/y-axis
  if(abs(distanceX)<combineHalfW){
    if(abs(distanceY)<combineHalfH){
      return true;
    }
  }
  return false;
}
//-------------
boolean rectangleIntersect(Bullet r1, Enemy r2){
  //distance apart xx-axis and yy-axis
  float distanceX=(r1.xx)- (r2.xx);
  float distanceY= (r1.yy)- (r2.yy);
  //combined half w/h
  float combineHalfW= r1.w/2 + r2.w/2;
  float combineHalfH= r1.h/2 + r2.h/2;
  //intersection x-axis/y-axis
  if(abs(distanceX)<combineHalfW){
    if(abs(distanceY)<combineHalfH){
      return true;
    }
  }
  return false;
}
//------------------------------------
void keyReleased(){
  switch (keyCode){
    case 37://left
    left=false;
    break;
     case 39://right
    right=false;
    break; case 38://up
    up=false;
    break; case 40://down
    down=false;
    break; 
    
    case 32://space
    space=false;
    break;
  }
}


//
////////////////////////////////////////////////////////////////////////////////////////
//--------------------CHARACTERSSXXX-------------------------------------------
void dibujoHI(){
  
HI.noStroke();
HI.beginDraw();

HI.fill(193,73,113);
//hair
HI.rect(23,16,10,10);
HI.fill(223,108,146);
HI.rect(30,15,10,10);
HI.rect(40,15,10,10);
HI.rect(48,16,10,10);
//
HI.fill(193,73,113);
HI.rect(17,20,10,10);
HI.fill(223,108,146);
HI.rect(20,20,10,10);
HI.rect(30,20,10,10);
HI.rect(40,20,10,10);
HI.rect(50,20,10,10);
HI.rect(52,20,10,10);
//
HI.fill(193,73,113);
HI.rect(16,30,10,10);
HI.fill(223,108,146);
HI.rect(20,30,10,10);
HI.rect(30,30,10,10);
HI.rect(40,30,10,10);
HI.rect(50,30,10,10);
HI.rect(55,30,10,10);
//
HI.fill(193,73,113);
HI.rect(13,40,10,10);
HI.fill(223,108,146);
HI.rect(20,40,10,10);
HI.rect(30,40,10,10);
HI.rect(40,40,10,10);
HI.rect(50,40,10,10);
HI.rect(57,40,10,10);

//boddy
HI.fill(250,227,196);
HI.rect(30,30,10,10);
HI.rect(40,30,10,10);
HI.rect(30,40,10,10);
HI.rect(40,40,10,10);

//hair detalls
HI.fill(223,108,146);
HI.rect(30,25,10,10);
HI.rect(46,26,10,10);

//clothes1
HI.fill(165,7,7);
HI.rect(25,50,10,10);
HI.fill(208,0,0);
HI.rect(30,50,10,10);
HI.rect(40,50,10,10);
HI.rect(46,50,10,10);
//
HI.fill(165,7,7);
HI.rect(23,55,10,10);
HI.fill(208,0,0);
HI.rect(49,55,10,10);
HI.rect(21,57,10,10);
HI.rect(52,57,10,10);

//boddy detalls
HI.fill(250,227,196);
HI.rect(35,42,10,10);

//armasxbody:(
HI.rect(23,60,10,10);
HI.rect(30,60,10,10);
HI.rect(40,60,10,10);
HI.rect(50,60,10,10);
//
HI.rect(22,70,10,10);
HI.rect(30,70,10,10);
HI.rect(40,70,10,10);
HI.rect(50,70,10,10);
HI.rect(51,70,10,10);
//
HI.rect(21,75,10,10);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(50,75,10,10);
HI.rect(53,75,10,10);

//box
HI.fill(165,7,7);
HI.rect(15,75,10,10);
HI.fill(255,1,0);
HI.rect(20,75,10,10);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(50,75,10,10);
HI.rect(56,75,10,10);
//
HI.fill(165,7,7);
HI.rect(13,78,10,10);
HI.fill(255,1,0);
HI.rect(20,78,10,10);
HI.rect(50,78,10,10);
HI.rect(59,78,10,10);

//pants
HI.fill(8,42,61);
HI.rect(28,85,10,10);
HI.fill(12,59,87);
HI.rect(35,83,10,10);
HI.rect(45,85,10,10);
//
HI.fill(8,42,61);
HI.rect(29,95,10,10);
HI.fill(12,59,87);
HI.rect(44,95,10,10);

//bluse
HI.fill(189,202,13);
HI.rect(28,60,10,10);
fill(212,226,18);
HI.rect(30,60,10,10);
HI.rect(40,60,10,10);
HI.rect(45,60,10,10);
//
HI.fill(189,202,13);
HI.rect(27,70,10,10);
HI.fill(212,226,18);
HI.rect(30,70,10,10);
HI.rect(40,70,10,10);
HI.rect(46,70,10,10);
//
HI.fill(189,202,13);
HI.rect(26,75,10,10);
HI.fill(212,226,18);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(47,75,10,10);

//mouse
HI.fill(198,209,37);
HI.rect(35,65,5,5);
HI.rect(45,65,5,5);
HI.rect(39,70,8,8);

//zpt
HI.fill(1);
HI.rect(29,100,10,10);
HI.rect(44,100,10,10);
HI.fill(255);
HI.rect(27,103,13,5);
HI.rect(44,103,13,5);

HI.endDraw();
image(HI,350,300);

}
//-----------
void HI2(){
  
HI.noStroke();
HI.beginDraw();

HI.fill(193,73,113);
//hair
HI.rect(23,16,10,10);
HI.fill(223,108,146);
HI.rect(30,15,10,10);
HI.rect(40,15,10,10);
HI.rect(48,16,10,10);
//
HI.fill(193,73,113);
HI.rect(17,20,10,10);
HI.fill(223,108,146);
HI.rect(20,20,10,10);
HI.rect(30,20,10,10);
HI.rect(40,20,10,10);
HI.rect(50,20,10,10);
HI.rect(52,20,10,10);
//
HI.fill(193,73,113);
HI.rect(16,30,10,10);
HI.fill(223,108,146);
HI.rect(20,30,10,10);
HI.rect(30,30,10,10);
HI.rect(40,30,10,10);
HI.rect(50,30,10,10);
HI.rect(55,30,10,10);
//
HI.fill(193,73,113);
HI.rect(13,40,10,10);
HI.fill(223,108,146);
HI.rect(20,40,10,10);
HI.rect(30,40,10,10);
HI.rect(40,40,10,10);
HI.rect(50,40,10,10);
HI.rect(57,40,10,10);

//boddy
HI.fill(250,227,196);
HI.rect(30,30,10,10);
HI.rect(40,30,10,10);
HI.rect(30,40,10,10);
HI.rect(40,40,10,10);

//hair detalls
HI.fill(223,108,146);
HI.rect(30,25,10,10);
HI.rect(46,26,10,10);

//clothes1
HI.fill(165,7,7);
HI.rect(25,50,10,10);
HI.fill(208,0,0);
HI.rect(30,50,10,10);
HI.rect(40,50,10,10);
HI.rect(46,50,10,10);
//
HI.fill(165,7,7);
HI.rect(23,55,10,10);
HI.fill(208,0,0);
HI.rect(49,55,10,10);
HI.rect(21,57,10,10);
HI.rect(52,57,10,10);

//boddy detalls
HI.fill(250,227,196);
HI.rect(35,42,10,10);

//armasxbody:(
HI.rect(23,60,10,10);
HI.rect(30,60,10,10);
HI.rect(40,60,10,10);
HI.rect(50,60,10,10);
//
HI.rect(22,70,10,10);
HI.rect(30,70,10,10);
HI.rect(40,70,10,10);
HI.rect(50,70,10,10);
HI.rect(51,70,10,10);
//
HI.rect(21,75,10,10);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(50,75,10,10);
HI.rect(53,75,10,10);

//box
HI.fill(165,7,7);
HI.rect(15,75,10,10);
HI.fill(255,1,0);
HI.rect(20,75,10,10);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(50,75,10,10);
HI.rect(56,75,10,10);
//
HI.fill(165,7,7);
HI.rect(13,78,10,10);
HI.fill(255,1,0);
HI.rect(20,78,10,10);
HI.rect(50,78,10,10);
HI.rect(59,78,10,10);

//pants
HI.fill(8,42,61);
HI.rect(28,85,10,10);
HI.fill(12,59,87);
HI.rect(35,83,10,10);
HI.rect(45,85,10,10);
//
HI.fill(8,42,61);
HI.rect(29,95,10,10);
HI.fill(12,59,87);
HI.rect(44,95,10,10);

//bluse
HI.fill(189,202,13);
HI.rect(28,60,10,10);
fill(212,226,18);
HI.rect(30,60,10,10);
HI.rect(40,60,10,10);
HI.rect(45,60,10,10);
//
HI.fill(189,202,13);
HI.rect(27,70,10,10);
HI.fill(212,226,18);
HI.rect(30,70,10,10);
HI.rect(40,70,10,10);
HI.rect(46,70,10,10);
//
HI.fill(189,202,13);
HI.rect(26,75,10,10);
HI.fill(212,226,18);
HI.rect(30,75,10,10);
HI.rect(40,75,10,10);
HI.rect(47,75,10,10);

//mouse
HI.fill(198,209,37);
HI.rect(35,65,5,5);
HI.rect(45,65,5,5);
HI.rect(39,70,8,8);

//zpt
HI.fill(1);
HI.rect(29,100,10,10);
HI.rect(44,100,10,10);
HI.fill(255);
HI.rect(27,103,13,5);
HI.rect(44,103,13,5);

HI.endDraw();
image(HI,150,random(5));

}
//------------

void CROW(){
  CROW.noStroke();
CROW.beginDraw();
//hair
CROW.fill(21,8,50);
CROW.rect(35,10,10,10);
CROW.rect(25,15,10,10);
CROW.rect(30,15,10,10);
CROW.rect(40,15,10,10);
CROW.rect(45,15,10,10);
//
CROW.rect(20,20,10,10);
CROW.rect(30,20,10,10);
CROW.rect(40,20,10,10);
CROW.rect(50,20,10,10);
//
CROW.rect(18,30,10,10);
CROW.rect(20,30,10,10);
CROW.rect(30,30,10,10);
CROW.rect(40,30,10,10);
CROW.rect(50,30,10,10);
CROW.rect(53,30,10,10);
//
CROW.rect(16,40,10,10);
CROW.rect(20,40,10,10);
CROW.rect(30,40,10,10);
CROW.rect(40,40,10,10);
CROW.rect(50,40,10,10);
CROW.rect(56,40,10,10);
//
CROW.rect(16,50,10,10);
CROW.rect(20,50,10,10);
CROW.rect(30,50,10,10);
CROW.rect(40,50,10,10);
CROW.rect(50,50,10,10);
CROW.rect(56,50,10,10);
//
CROW.rect(16,60,10,10);
CROW.rect(20,60,10,10);
CROW.rect(30,60,10,10);
CROW.rect(40,60,10,10);
CROW.rect(50,60,10,10);
CROW.rect(56,60,10,10);
//
CROW.rect(16,65,10,10);
CROW.rect(20,65,10,10);
CROW.rect(56,65,10,10);


//body
CROW.fill(239,217,188);
CROW.rect(30,30,10,10);
CROW.rect(40,30,10,10);
CROW.rect(30,40,10,10);
CROW.rect(40,40,10,10);

//hair detalls
CROW.fill(21,8,50);
CROW.rect(30,28,10,10);
CROW.rect(40,28,10,10);

//clothes
CROW.fill(106,97,132);
CROW.rect(30,50,10,10);
CROW.rect(40,50,10,10);

//boddy detalls
CROW.fill(239,217,188);
CROW.rect(35,42,10,10);
CROW.rect(35,45,10,10);

//detallsbottomclothes
CROW.fill(106,97,132);
CROW.rect(32,50,5,7);
CROW.rect(44,50,5,7);

//armasxbody:(
CROW.fill(239,217,188);
CROW.rect(23,60,10,10);
CROW.rect(50,60,10,10);
//
CROW.rect(22,70,10,10);
CROW.rect(51,70,10,10);
//
CROW.rect(21,75,10,10);
CROW.rect(30,75,10,10);
CROW.rect(53,75,10,10);

//legs
CROW.rect(28,85,10,10);
CROW.rect(35,85,10,10);
CROW.rect(45,85,10,10);
//
CROW.rect(29,95,10,10);
CROW.rect(39,79,10,10);
CROW.rect(44,95,10,10);
CROW.rect(29,100,10,10);
CROW.rect(44,100,10,10);

//dress
CROW.fill(180,177,200);
CROW.rect(28,60,10,10);
CROW.rect(30,60,10,10);
CROW.rect(40,60,10,10);
CROW.rect(45,60,10,10);
//
CROW.fill(220,197,130);
CROW.rect(27,70,10,10);
CROW.rect(30,70,10,10);
CROW.rect(40,70,10,10);
CROW.rect(46,70,10,10);
//
CROW.fill(180,177,200);
CROW.rect(26,75,10,10);
CROW.rect(30,75,10,10);
CROW.rect(40,75,10,10);
CROW.rect(47,75,10,10);

//partofthedress
CROW.fill(180,177,200);
CROW.rect(25,78,12,7);
CROW.rect(37,76,12,7);
CROW.rect(37,78,12,7);
CROW.rect(47,78,12,7);
//
CROW.rect(24,85,10,10);
CROW.rect(38,85,10,10);
CROW.rect(52,85,10,10);
//
CROW.fill(180,177,200);
CROW.rect(31,85,7,5);
CROW.rect(46,85,7,5);
//ZPT
fill(180,177,200);
CROW.rect(29,105,10,5);
CROW.rect(44,105,10,5);
//
CROW.fill(220,197,130);
CROW.rect(31,105,5,2);
CROW.rect(46,105,5,2);



CROW.endDraw();
image(CROW,430,300);
}
//-----

void FIGHT(){
FIGHT.noStroke();
FIGHT.beginDraw();
//F//  
FIGHT.fill(255,random(113),158);
FIGHT.rect(90,56,10,10);
FIGHT.rect(100,54,10,10);
FIGHT.rect(110,52,10,10);
FIGHT.rect(120,50,10,10);
FIGHT.rect(130,48,10,10);
FIGHT.rect(140,46,10,10);
FIGHT.rect(150,44,10,10);
//
FIGHT.rect(85,60,10,10);
FIGHT.rect(90,60,10,10);
FIGHT.rect(100,60,10,10);
FIGHT.rect(110,60,10,10);
FIGHT.rect(120,58,10,10);
FIGHT.rect(130,56,10,10);
FIGHT.rect(140,54,10,10);
FIGHT.rect(150,52,10,10);
//
FIGHT.rect(83,70,10,10);
FIGHT.rect(90,70,10,10);
FIGHT.rect(100,70,10,10);
FIGHT.rect(110,70,10,10);
FIGHT.rect(120,68,10,10);
FIGHT.rect(130,66,10,10);
FIGHT.rect(140,64,10,10);
FIGHT.rect(148,62,10,10);
//
FIGHT.rect(82,80,10,10);
FIGHT.rect(90,80,10,10);
FIGHT.rect(100,80,10,10);
FIGHT.rect(108,80,10,10);
FIGHT.rect(110,87,10,10);
FIGHT.rect(120,86,10,10);
FIGHT.rect(130,85,10,10);
//
FIGHT.rect(85,90,10,10);
FIGHT.rect(90,90,10,10);
FIGHT.rect(100,90,10,10);
FIGHT.rect(110,92,10,10);
FIGHT.rect(120,91,10,10);
FIGHT.rect(128,90,10,10);
//
FIGHT.rect(88,100,10,10);
FIGHT.rect(90,100,10,10);
FIGHT.rect(100,100,10,10);
FIGHT.rect(110,100,10,10);
FIGHT.rect(115,100,10,10);
//
FIGHT.rect(92,110,10,10);
FIGHT.rect(100,110,10,10);
FIGHT.rect(110,110,10,10);
FIGHT.rect(113,110,10,10);
//
FIGHT.rect(94,117,10,10);
FIGHT.rect(103,116,10,10);
FIGHT.rect(109,115,10,10);

//i
FIGHT.fill(200,random(173),288);
FIGHT.rect(178,85,8,8);
FIGHT.rect(173,80,8,8);
FIGHT.rect(180,80,8,8);
FIGHT.rect(183,80,8,8);
//--
FIGHT.rect(170,75,8,8);
FIGHT.rect(178,75,8,8);
FIGHT.rect(185,75,8,8);
//--
FIGHT.rect(172,71,8,8);
FIGHT.rect(180,74,5,5);
FIGHT.rect(183,71,8,8);

//
FIGHT.fill(255,random(113),158);
FIGHT.rect(164,95,10,10);
FIGHT.rect(170,95,10,10);
FIGHT.rect(180,95,10,10);
FIGHT.rect(187,95,10,10);

//
FIGHT.rect(160,100,10,10);
FIGHT.rect(170,100,10,10);
FIGHT.rect(180,100,10,10);
FIGHT.rect(190,100,10,10);
//
FIGHT.rect(163,110,10,10);
FIGHT.rect(170,110,10,10);
FIGHT.rect(180,110,10,10);
FIGHT.rect(187,110,10,10);
//
FIGHT.rect(164,113,10,10);
FIGHT.rect(174,114,10,10);
FIGHT.rect(184,113,10,10);


//g
FIGHT.rect(220,80,10,10);
FIGHT.rect(230,80,10,10);
FIGHT.rect(240,80,10,10);
FIGHT.rect(250,80,10,10);
//
FIGHT.rect(217,90,10,10);
FIGHT.rect(220,90,10,10);
FIGHT.rect(230,90,10,10);
FIGHT.rect(240,90,10,10);
FIGHT.rect(250,90,10,10);
FIGHT.rect(253,90,10,10);
//
FIGHT.rect(218,100,10,10);
FIGHT.rect(225,100,10,10);
FIGHT.rect(235,100,10,10);
FIGHT.rect(245,100,10,10);
FIGHT.rect(254,100,10,10);
//
FIGHT.rect(245,110,10,10);
FIGHT.rect(250,110,10,10);
FIGHT.rect(255,110,10,10);
//
FIGHT.rect(245,115,10,10);
FIGHT.rect(250,115,10,10);
FIGHT.rect(255,115,10,10);
FIGHT.rect(230,115,10,10);
//
FIGHT.rect(230,120,10,11);
FIGHT.rect(235,120,10,11);
FIGHT.rect(240,120,10,12);
FIGHT.rect(245,120,10,13);
FIGHT.rect(250,120,10,12);
FIGHT.rect(255,120,10,9);


//H
FIGHT.rect(281,47,10,10);
FIGHT.rect(285,47,10,10);
//
FIGHT.rect(279,50,10,10);
FIGHT.rect(285,50,10,10);
FIGHT.rect(290,50,10,10);
//
FIGHT.rect(279,60,10,10);
FIGHT.rect(285,60,10,10);
FIGHT.rect(290,60,10,10);
//
FIGHT.rect(279,70,10,10);
FIGHT.rect(285,70,10,10);
FIGHT.rect(295,70,10,10);
FIGHT.rect(300,70,10,10);
FIGHT.rect(310,70,10,10);
FIGHT.rect(318,70,10,10);
//
FIGHT.rect(280,80,10,10);
FIGHT.rect(290,80,10,10);
FIGHT.rect(300,80,10,10);
FIGHT.rect(310,80,10,10);
FIGHT.rect(320,80,10,10);
//
FIGHT.rect(280,90,10,10);
FIGHT.rect(290,90,10,10);
FIGHT.rect(300,90,10,10);
FIGHT.rect(310,90,10,10);
FIGHT.rect(320,90,10,10);
//
FIGHT.rect(280,100,10,10);
FIGHT.rect(290,100,10,10);
FIGHT.rect(300,100,10,10);
FIGHT.rect(310,100,10,10);
FIGHT.rect(320,100,10,10);
//
FIGHT.rect(282,104,10,10);
FIGHT.rect(289,108,10,10);
FIGHT.rect(293,103,10,10);
//
FIGHT.rect(313,103,10,10);
FIGHT.rect(316,108,10,10);
FIGHT.rect(320,105,10,10);

//t
FIGHT.rect(353,55,10,10);
FIGHT.rect(360,55,10,10);
FIGHT.rect(367,55,10,10);
//
FIGHT.rect(350,60,10,10);
FIGHT.rect(360,60,10,10);
FIGHT.rect(370,60,10,10);
//
FIGHT.rect(350,65,10,10);
FIGHT.rect(360,65,10,10);
FIGHT.rect(370,65,10,10);
//
FIGHT.rect(345,75,10,10);
FIGHT.rect(350,75,10,10);
FIGHT.rect(360,75,10,10);
FIGHT.rect(370,75,10,10);
FIGHT.rect(375,75,10,10);
//
FIGHT.rect(340,80,10,10);
FIGHT.rect(350,80,10,10);
FIGHT.rect(360,80,10,10);
FIGHT.rect(370,80,10,10);
FIGHT.rect(380,80,10,10);
//
FIGHT.rect(343,85,10,10);
FIGHT.rect(350,85,10,10);
FIGHT.rect(360,85,10,10);
FIGHT.rect(370,85,10,10);
FIGHT.rect(377,85,10,10);
//
FIGHT.rect(350,95,10,10);
FIGHT.rect(360,95,10,10);
FIGHT.rect(370,95,10,10);
//
FIGHT.rect(350,100,10,10);
FIGHT.rect(360,100,10,10);
FIGHT.rect(370,100,10,10);
//
FIGHT.rect(353,105,10,10);
FIGHT.rect(365,105,10,10);
FIGHT.rect(375,105,10,10);
FIGHT.rect(385,104,10,10);
FIGHT.rect(395,103,10,10);
//
FIGHT.rect(357,110,10,10);
FIGHT.rect(365,110,10,10);
FIGHT.rect(375,110,10,10);
FIGHT.rect(385,110,10,10);
FIGHT.rect(395,110,10,10);
//


FIGHT.endDraw();
image(FIGHT,270,random(5));
}
//------
void KOI(){
 KOI.noStroke();
  KOI.beginDraw();
  KOI.fill(1);
  KOI.rect(33,5,10,10);
  KOI.rect(43,5,10,10);
  KOI.rect(53,5,10,10);
  //
  KOI.rect(25,10,10,10);
  KOI.rect(33,10,10,10);
  KOI.rect(43,10,10,10);
  KOI.rect(53,10,10,10);
  KOI.rect(62,10,10,10);
  //
  KOI.rect(23,15,10,10);
  KOI.rect(30,15,10,10);
  KOI.rect(40,15,10,10);
  KOI.rect(50,15,10,10);
  KOI.rect(60,15,10,10);
  KOI.rect(65,15,10,10);
  //
  KOI.rect(20,20,10,10);
  KOI.rect(30,20,10,10);
  KOI.rect(40,20,10,10);
  KOI.rect(50,20,10,10);
  KOI.rect(60,20,10,10);
  KOI.rect(70,20,10,10);
  //
  KOI.rect(15,30,10,10);
  KOI.rect(20,30,10,10);
  KOI.rect(30,30,10,10);
  KOI.rect(40,30,10,10);
  KOI.rect(50,30,10,10);
  KOI.rect(60,30,10,10);
  KOI.rect(70,30,10,10);
  KOI.rect(75,30,10,10);
  //
  KOI.rect(14,40,10,10);
  KOI.rect(20,40,10,10);
  KOI.rect(30,40,10,10);
  KOI.rect(40,40,10,10);
  KOI.rect(50,40,10,10);
  KOI.rect(60,40,10,10);
  KOI.rect(70,40,10,10);
  KOI.rect(77,40,10,10);
  //
  KOI.rect(14,50,10,10);
  KOI.rect(28,50,10,10);
  KOI.rect(30,50,10,10);
  KOI.rect(40,50,10,10);
  KOI.rect(50,50,10,10);
  KOI.rect(60,50,10,10);
  KOI.rect(63,50,10,10);
  KOI.rect(77,50,10,10);
  //
  KOI.rect(13,60,10,10);
  KOI.rect(29,60,10,10);
  KOI.rect(30,60,10,10);
  KOI.rect(40,60,10,10);
  KOI.rect(50,60,10,10);
  KOI.rect(60,60,10,10);
  KOI.rect(62,60,10,10);
  KOI.rect(78,60,10,10);
  //
  KOI.rect(13,70,10,10);
  KOI.rect(31,70,10,10);
  KOI.rect(40,70,10,10);
  KOI.rect(50,70,10,10);
  KOI.rect(60,70,10,10);
  KOI.rect(78,70,10,10);
  //
  KOI.rect(13,80,10,10);
  KOI.rect(33,80,10,10);
  KOI.rect(37,80,10,10);
  KOI.rect(53,80,10,10);
  KOI.rect(58,80,10,10);
  KOI.rect(78,80,10,10);
  //
  KOI.rect(14,90,10,10);
  KOI.rect(33,90,10,10);
  KOI.rect(36,90,10,10);
  KOI.rect(55,90,10,10);
  KOI.rect(58,90,10,10);
  KOI.rect(77,90,10,10);
  //
  KOI.rect(35,100,10,10);
  KOI.rect(56,100,10,10);
  //eyes
  KOI.fill(185,235,69);
  KOI.rect(35,20,10,10,2,2,2,2);
  KOI.rect(55,20,10,10,2,2,2,2);
  KOI.rect(35,28,10,10,2,2,2,2);
  KOI.rect(55,28,10,10,2,2,2,2);
  KOI.endDraw();
  image(KOI,600,300);
}
////------------------------
void KOI2(){
 KOI.noStroke();
  KOI.beginDraw();
  KOI.fill(1);
  KOI.rect(33,5,10,10);
  KOI.rect(43,5,10,10);
  KOI.rect(53,5,10,10);
  //
  KOI.rect(25,10,10,10);
  KOI.rect(33,10,10,10);
  KOI.rect(43,10,10,10);
  KOI.rect(53,10,10,10);
  KOI.rect(62,10,10,10);
  //
  KOI.rect(23,15,10,10);
  KOI.rect(30,15,10,10);
  KOI.rect(40,15,10,10);
  KOI.rect(50,15,10,10);
  KOI.rect(60,15,10,10);
  KOI.rect(65,15,10,10);
  //
  KOI.rect(20,20,10,10);
  KOI.rect(30,20,10,10);
  KOI.rect(40,20,10,10);
  KOI.rect(50,20,10,10);
  KOI.rect(60,20,10,10);
  KOI.rect(70,20,10,10);
  //
  KOI.rect(15,30,10,10);
  KOI.rect(20,30,10,10);
  KOI.rect(30,30,10,10);
  KOI.rect(40,30,10,10);
  KOI.rect(50,30,10,10);
  KOI.rect(60,30,10,10);
  KOI.rect(70,30,10,10);
  KOI.rect(75,30,10,10);
  //
  KOI.rect(14,40,10,10);
  KOI.rect(20,40,10,10);
  KOI.rect(30,40,10,10);
  KOI.rect(40,40,10,10);
  KOI.rect(50,40,10,10);
  KOI.rect(60,40,10,10);
  KOI.rect(70,40,10,10);
  KOI.rect(77,40,10,10);
  //
  KOI.rect(14,50,10,10);
  KOI.rect(28,50,10,10);
  KOI.rect(30,50,10,10);
  KOI.rect(40,50,10,10);
  KOI.rect(50,50,10,10);
  KOI.rect(60,50,10,10);
  KOI.rect(63,50,10,10);
  KOI.rect(77,50,10,10);
  //
  KOI.rect(13,60,10,10);
  KOI.rect(29,60,10,10);
  KOI.rect(30,60,10,10);
  KOI.rect(40,60,10,10);
  KOI.rect(50,60,10,10);
  KOI.rect(60,60,10,10);
  KOI.rect(62,60,10,10);
  KOI.rect(78,60,10,10);
  //
  KOI.rect(13,70,10,10);
  KOI.rect(31,70,10,10);
  KOI.rect(40,70,10,10);
  KOI.rect(50,70,10,10);
  KOI.rect(60,70,10,10);
  KOI.rect(78,70,10,10);
  //
  KOI.rect(13,80,10,10);
  KOI.rect(33,80,10,10);
  KOI.rect(37,80,10,10);
  KOI.rect(53,80,10,10);
  KOI.rect(58,80,10,10);
  KOI.rect(78,80,10,10);
  //
  KOI.rect(14,90,10,10);
  KOI.rect(33,90,10,10);
  KOI.rect(36,90,10,10);
  KOI.rect(55,90,10,10);
  KOI.rect(58,90,10,10);
  KOI.rect(77,90,10,10);
  //
  KOI.rect(35,100,10,10);
  KOI.rect(56,100,10,10);
  //eyes
  KOI.fill(185,235,69);
  KOI.rect(35,20,10,10,2,2,2,2);
  KOI.rect(55,20,10,10,2,2,2,2);
  KOI.rect(35,28,10,10,2,2,2,2);
  KOI.rect(55,28,10,10,2,2,2,2);
  KOI.endDraw();
  image(KOI,800,random(5));
}