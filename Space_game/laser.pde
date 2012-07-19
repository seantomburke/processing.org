class laser
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  laser(float xpos, float ypos, float xspeed, float yspeed)
  {
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
  }

  void move()
  {
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
  }

  void display()
  {
    fill(0, 255, 0);
    rect(xpos, ypos, width, 100);
  }
  float getlaserx()
  {
    return xpos;
  }
  float getlasery()
  {
    return ypos;
  }
}

