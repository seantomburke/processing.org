class enemy4 extends enemy
{
  enemy4 (float xpos, float ypos, float xdirection, float ydirection)
  {
    super (xpos, ypos);
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=15;
    this.yspeed=15;
    this.xdirection=xdirection;
    this.ydirection=ydirection;
    this.score=150;
    this.health=1;
  }

  void move()
  {
    if (xpos>width-20-width/10 && xpos<width)
    {
      xdirection=-xdirection;
      xpos=width-20-width/10;
    }
    if (xpos<20+width/10 && xpos>0)
    {
      xdirection=-xdirection;
      xpos=20+width/10;
    }
    if (ypos<20 && ypos>-100)
    {
      ydirection=-ydirection;
      ypos=20;
    }
    if (ypos>height*3/4 && ypos<height)
    {
      ydirection=-ydirection;
      ypos=height*3/4;
    }

    xpos=xpos+xspeed*xdirection;
    ypos=ypos+yspeed*ydirection;
  }

  void display()
  {
    fill (232, 100, 199);
    ellipse(xpos, ypos, 20, 20);
  }
}

