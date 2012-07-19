class enemy3 extends enemy
{
  enemy3 (float xpos, float ypos, float xdirection, float ydirection)
  {
    super (xpos, ypos);
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=30;
    this.yspeed=2;
    this.xdirection=xdirection;
    this.ydirection=ydirection;
    this.score=100;
    this.health=1;
  }

  void move()
  {
    if (xpos>width-20-width/10)
    {
      xdirection=-xdirection;
      xpos=width-20-width/10;
    }
    if (xpos<20+width/10)
    {
      xdirection=-xdirection;
      xpos=20+width/10;
    }

    xpos=xpos+xspeed*xdirection;
    ypos=ypos+yspeed*ydirection;
  }

  void display()
  {
    fill (142, 53, 239);
    rect(xpos, ypos, 20, 20);
  }
}

