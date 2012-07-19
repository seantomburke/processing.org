class enemy2 extends enemy
{
  float enemy2w=30;
  float enemy2h=10;

  enemy2 (float xpos, float ypos, float xdirection, float ydirection)
  {
    super (xpos, ypos);
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=5;
    this.yspeed=2;
    this.xdirection=xdirection;
    this.ydirection=ydirection;
    this.score=50;
    this.health=1;
  }
  void move()
  {
    xpos=xpos+xspeed*xdirection;
    ypos=ypos+yspeed*ydirection;
  }
  void display()
  {
    fill (0, 0, 255);
    ellipse (xpos, ypos, enemy2w, enemy2h);
  }
}

