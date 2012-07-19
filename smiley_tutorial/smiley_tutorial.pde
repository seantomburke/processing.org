//* Sean Burke
//  July 18, 2011


int shapesize;       // Width of the shape
float xpos, ypos;    // Starting position of shape    
float xspeed;  // Speed of the shape
float yspeed;  // Speed of the shape
int xdirection;  // Left or Right direction
int ydirection;  // Top to Bottom direction
int xacceleration; //x multiplier to speed or slow smiley
int yacceleration; //y multiplier to speed or slow smiley
int maxspeed; //the maximum allowed speed
int minspeed;  //the minimum allowed speed

void setup() {
  size(320, 240); // set up the size of your window
  frameRate(60);  // set the speed of your animation
  smooth();     //draw smooth shapes
  xpos = width/2; // Set the x starting position of the shape to the center 
  ypos = height/2; // Set the y starting position of the shape to the center
  
 shapesize = 50;
 xspeed = 3;
 yspeed = 2;
 xdirection = 1;
 ydirection = 1;
 xacceleration = 1;
 yacceleration = 1;
 maxspeed = 20;
 minspeed = 1;
}

void draw()
{
  background(0,255);

  //draw background to cover old smiley faces
  xpos = xpos + ( xspeed * xdirection ); //add x speed multiplier to smiley
  ypos = ypos + ( yspeed * ydirection ); //add y speed multiplier to smiley
  
  // Test to see if the shape exceeds the boundaries of the screen
  // screens x length is denoted by width
  // screens y length is denoted by height
  // (0,0) is at top right.
  // If it does, reverse its direction by multiplying by -1
  // add accelertion mulitiplier to increase the speed
  if (xpos > width-shapesize || xpos < shapesize) {
    xdirection = xdirection * -1;
    xspeed += xacceleration;
  }
  if (ypos > height-shapesize || ypos < shapesize) {
    ydirection *= -1;
    yspeed += yacceleration;
  }
  
  //if the speed exceeds the maximum speed, set the speed to the maximum speed
  //to avoid a runaway smiley
  //invert the acceleration to slow the smiley down
  if (xspeed > maxspeed)
  {
    xspeed = maxspeed; // set speed to maxspeed
    xacceleration = -xacceleration; //invert acceleration 
  }
  if (yspeed > maxspeed)
  {
    yspeed = maxspeed;
    yacceleration = -yacceleration;
  }
  
  //if the speed goes below the minimum speed
  //set the speed to the minimum speed
  //to avoid a runaway smiley
  //invert the acceleration to speed the smiley up
  
  if (xspeed < minspeed)
  {
    xspeed = minspeed; // set the speed to minspeed
    xacceleration = -xacceleration; //invert acceleration
  }
  if (yspeed < minspeed)
  {
    yspeed = minspeed;
    yacceleration = -yacceleration;
  }
  
  // draw face
  fill(#ffff00); //color yellow
  ellipse(xpos, ypos, 100, 100); 
  
  //draw right eye
  fill(#0000ff);//color blue
  ellipse(xpos+ 15, ypos - 15, 20, 20); 
  
  //draw left eye
  fill(#0000ff);//color blue
  ellipse(xpos - 15, ypos - 15, 20, 20); 
  
  //draw mouth
  fill(0); //color black
  ellipse(xpos + 0, ypos + 20, 40, 10); 
  
}
