class enemy1 extends enemy
{

  enemy1(float xpos, float ypos, float xspeed, float yspeed)
  {
    super(xpos, ypos);

    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    this.xdirection=1;
    this.ydirection=1;
    this.score=10;
    this.health=1;
  }

  void move() 
  {
    xpos=xpos+(xspeed*xdirection);
    ypos=ypos+(yspeed*ydirection);
  }

  void display()
  {
    fill(255, 0, 0);
    rect(xpos, ypos, 10, 15);
  }
}

