class Bullet{
  float xx,yy,w,h;
  float speed, rotation, maxSpeed,minSpeed;
  boolean firing;
  
  Bullet(){
    xx=100;
    yy=-100;
    w=20;
    h=10;
    
    speed= 0;
    rotation= 1;
    maxSpeed=20;
    minSpeed=4;
    firing=false;
  }
  
  void setStarLocation(float startX,float startY, float startRotation){
  if(firing==false){
  xx= startX;
  yy= startY;
  rotation= startRotation;
  firing=true;
  speed=17;
  }
  }
  void update(){
    if(firing==true){
      if(speed>minSpeed){
        speed-=0.5;
      }
     // speed=maxSpeed;
      xx+= cos(rotation)* speed;
      yy+= sin(rotation)* speed;
      //moving out of bounds
      if(xx>width||xx<0||yy>height||yy<0){
        reset();
      }
    }
  }
  void reset(){
    speed=0;
    firing=false;
    yy=-100; 
  }
  void display(){
    pushMatrix();
    translate(xx,yy);
    rotate(rotation);
    noStroke();
    fill(random(235),random(243),210);
    rect(-w,h/-2, w,h,5,5,5,5);
    popMatrix();
  }

}