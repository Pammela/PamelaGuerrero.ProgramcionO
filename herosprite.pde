class Sprite{
  float xx,yy,w,h;
  //float speedX,speedY;
  float speed, rotation, maxSpeed;

  Sprite(){
    xx=100;
    yy=100;
    w=30;
    h=30;
    
    //speedX=0;
    //speedY=0;
    speed= 0;
    rotation= 0;
    maxSpeed=10;
  }
  
  void update(){
    if(left){
      //speedX=-2;
      rotation-=radians(5);
    }
    if(right){
      //speedX=2;
      rotation+=radians(5);
    }
    //if(!left && !right){
    // speedX=0;
   // }
    //----------
    if(up){
      //speedY=-2;
      //speed=5;
      if(speed<maxSpeed){
        speed+=1;    
    }
    }
    if(down){
      //speedY=2;
      //speed=0;
      if(speed>0){
        speed=0.5;
      }else{
        speed=0;
      }
    }
    if(!up && !down){
      //speedY=0;
      if(speed>0){
        speed*=0.98;
      }
    }
    else if(! up && down){
     // speedY=0;
    }
    
    //xx+= speedX;
    //yy += speedY;
    xx+=cos(rotation)* speed;
    yy+=sin(rotation)*speed;
    //
    if(xx>width){xx=0;}
    if(xx<0){xx=width;}
    if(yy>height){yy=0;}
    if(yy<0){yy=height;}
      
  }
  
  void die(){
    xx=200;
    yy=300;
    speed= 0;
    rotation= 0;
  
  }
   void reset(){
     lives--;
     s.xx=200;
     s.yy= random(300,height-50);
   }
  void display(){
    //fill(0,0,255);
    //rect(xx,yy,w,h);
    pushMatrix();
    translate(xx,yy);
    rotate(rotation);
    noStroke();
    fill(283,random(170),230);
    rect(-w,h/-2,w,h,5,5,5,5);
    popMatrix();
  }
}
  