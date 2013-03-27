class Enemy {
  float xpos, ypos;
  int enemywidth = 10;
  int enemyheight = 10;
  float xspeed;            // Speed of the shape
  float yspeed;            // Speed of the shape
  int xdirection = 1;      // Left or Right direction
  int ydirection = -1;     // Top to Bottom direction
  int xacceleration = 1;   // x multiplier to speed or slow smiley
  int yacceleration = 1;   // y multiplier to speed or slow smiley
  int maxspeed = 10;       // the maximum allowed speed
  int minspeed = 1;        // the minimum allowed speed
  PImage enemyImage;

  Enemy(float xpos, float ypos, float xspeed, float yspeed)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    enemyImage = loadImage("nyan.png");
  }

  void display() {
    image(enemyImage, xpos, ypos);
  }

  boolean collide(Vector<Projectile> ps) {
    for (Projectile p: ps)
    {
      float dx = p.xpos - (this.xpos + this.enemyImage.width/2);
      float dy = p.ypos - (this.ypos + this.enemyImage.height/2);
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = (p.laserwidth + this.enemyImage.height/2)/2;
      if (distance < minDist) 
      {
        this.xpos = (3*width)/4;
        this.ypos = random(height);
        this.xspeed = random(10);
        this.yspeed = random(10);
        return true;
      }
    }  
    return false;
  }

  void move() {

    if (ypos > height - enemyImage.height || ypos < 0) {
      ydirection *= -1;
      yspeed += yacceleration;
    }

    if (xpos > width - enemyImage.width || xpos < width/2) {
      xdirection *= -1;
      xspeed += xacceleration;
    }

    if (xspeed > maxspeed) {
      xspeed = maxspeed;               // set speed to maxspeed
      xacceleration = -xacceleration;  // invert acceleration
    }

    if (yspeed > maxspeed) {
      yspeed = maxspeed;
      yacceleration = -yacceleration;
    }
    
    if (ypos > height) {
      ypos = height;
    }

    if (xpos > width) {
      xpos = width;
    }

    if (xpos < width/2) {
      xpos = width/2;
    }

    if (ypos < 0) {
      ypos = 0;
    }



    // if the speed goes below the minimum speed
    // set the speed to the minimum speed
    // to avoid a runaway enemy
    // invert the acceleration to speed the enemy up

    if (xspeed < minspeed) {
      xspeed = minspeed;                 // set the speed to minspeed
      xacceleration = -xacceleration;    // invert acceleration
    }

    if (yspeed < minspeed) {
      yspeed = minspeed;
      yacceleration = -yacceleration;
    }

    ypos = ypos + ( yspeed * ydirection );
    xpos = xpos + ( xspeed * xdirection );
  }
}


