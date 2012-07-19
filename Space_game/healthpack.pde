class healthpack extends powerup
{
  healthpack(float xpos, float ypos, float xspeed, float yspeed)
  {
    super(xpos, ypos, xspeed, yspeed);

    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    this.powersize=20;
  }

  void move()
  {
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
  }

  void display()
  {
    fill(255);
    rect(xpos, ypos, powersize, powersize);
    fill(255, 0, 0);
    rect(xpos+powersize/3, ypos, powersize/3, powersize);
    rect(xpos, ypos+powersize/3, powersize, powersize/3);
  }
}

