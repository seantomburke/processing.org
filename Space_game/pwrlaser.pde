class pwrlaser extends powerup
{
  pwrlaser(float xpos, float ypos, float xspeed, float yspeed)
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
    fill(52, 135, 129);
    rect(xpos, ypos, powersize, powersize);
    fill(255, 232, 142);
    rect(xpos, ypos+powersize/3, powersize, powersize/3);
  }
}

