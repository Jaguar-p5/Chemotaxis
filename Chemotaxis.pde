void setup(){
  size(555, 555);
  for(int i = 0; i < critters.length; i++){
    critters[i] = new Prey();
  frameRate(11);
  }
}
Fox bob = new Fox();
Prey[] critters = new Prey[9];
void draw(){
 background(0);
 
 bob.show();

 
 bob.move();
 for(int i = 0; i < critters.length; i++){

   
   if(critters[i].getAlive() == true){
      critters[i].move();
      critters[i].show();
      checkCollision(bob, critters[i]);
      bob.track(critters[i]);
   }
 }
 
}


class Fox extends Prey {

 float pheta = 0 ; // pheta should be proper to what it looks like on the screen, behaves as written. pheta must be accurate.
 float close = 0; 
  Fox(){
    myX = 250;
    myY = 450;
    myCol = color(255, 99, 11);
    close = 0;
  }
  
  void show(){
    fill(myCol);
    ellipse(myX, myY, 100, 100);
  }
  void move(){
    
    myX += (Math.random()* 20 - 10) + 9 * cos(pheta);
    myY += (Math.random()* 20 - 10) + 9 * -sin(pheta);  // negative b/c down on screen is positive
  }
  
  
  // atan can give the positive * positve OR negative * negative
  // 
  void track(Prey A){
  float xDif = A.getX() - myX;
  float yDif = A.getY() - myY;
  if((xDif*xDif + yDif*yDif) > close){
  close =   xDif*xDif + yDif*yDif;
  float newtheta = atan(-yDif/ xDif);
  if(xDif < 0 && -yDif < 0){
   newtheta -= PI;
  }
  if(xDif < 0 && -yDif > 0)
    newtheta += PI;

  pheta = newtheta;
  A.setPheta(newtheta);
  
  }
  }  
  
}
 

boolean checkCollision(Fox a, Prey b){
  if(dist(a.getX(), a.getY(), b.getX(), b.getY()) <= a.getRadius() + b.getRadius()){
    b.setAlive(); 
    a.close = 0;
    return true;
  }
  return false;
}


public class Prey {
  float myX, myY;
  float pheta; 
  boolean isAlive;
  color myCol;
  Prey(){
    myX = 200;
    myY = 200;
    isAlive = true;
    pheta = (float)Math.random() * PI * 2;
    myCol = color(72, 222, 42);
  }
  Prey(float x, float y){
  myX = x;
  myY = y;
  }
    void move(){
    
    myX += (Math.random()* 20 - 10) + 6 * cos(pheta);
    myY += (Math.random()* 20 - 10) + 6 * -sin(pheta);  // negative b/c down on screen is positive
    if(myY >= height )
      myY = 0;
    if(myX >= width )
      myX = 0;
    if(myY <= 0 )
      myY = height;
    if(myX <= 0 )
      myX = width;

}
  void show(){
    fill(myCol);
    ellipse(myX, myY, 100, 100);
  }
  float getX(){
    return myX;
  }
  float getY(){
    return myY;
  }
  float getRadius(){
    return 50;
  }
  boolean getAlive(){
    return isAlive;
  }
  public void setAlive(){
    isAlive = false;
  }
  void setPheta(float z){
    pheta = z;
  }
}

// 
