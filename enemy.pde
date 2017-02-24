class Enemy{
  float xx,yy,w,h;
  //float speedX,speedY;
  float speed,rotation, maxSpeed;

  Enemy(){
    xx=random(900, width-100);;
    yy= random(300,height-100);
    w=40;
    h=100;
    
    //speedX=0;
    //speedY=0;
    speed=0;
    rotation=0;
    maxSpeed=3;
  }
  void die(){
    xx=random(900, width-100);;
    yy= random(300,height-100);
    speed=0;
    rotation=0;
  }
  void update(Sprite s){
    //distance enemy and sprite
    float distanceApart= dist(xx,yy,s.xx, s.yy);
    if(distanceApart <300){
    //distant apart.. smaller than y 
      rotation= atan2((s.yy-yy),(s.xx-xx));
      if(speed<maxSpeed){
        speed+=0.2;
      }
    
  }else{
    if(speed>0){
      speed*=0.95;
    }
  }
  xx+=cos(rotation)*speed;
  yy+=sin(rotation)*speed;
}

void reset(){
   e.xx=700;
   e.yy=random(300,height-50);   
 }
  
  void display(){
    //fill(250,100,255);
    //rect(xx,yy,w,h);
    pushMatrix();
    translate(xx,yy);
    rotate(rotation);
    noStroke();
    fill(100,205,random(290),180);
    rect(-w,h/-2,w,h,11,11,11,11);
    popMatrix();
  }
}
  