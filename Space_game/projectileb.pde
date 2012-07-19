class projectileb
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float shapesize;
  projectileb(float xpos, float ypos)
  {
    this.xpos=xpos;
    this.ypos=ypos;
    this.yspeed=10;
    this.shapesize=10;
  }

  void move()
  {
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
  }

  void display()
  {
    fill(0, 255, 0);
    ellipse(xpos, ypos, shapesize, shapesize*2);
  }

  float getprobx()
  {
    return xpos;
  }

  float getproby()
  {
    return ypos;
  }
}

