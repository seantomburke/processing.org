class boss1 extends enemy
{
  float xacceleration=1;
  float yacceleration=1;
  int maxspeed=5;
  int minspeed=0;
  boss1(float xpos, float ypos, float xdirection, float ydirection)
  {
    super(xpos, ypos);
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=5;
    this.yspeed=5;
    this.xdirection=xdirection;
    this.ydirection=ydirection;
    this.xacceleration=xacceleration;
    this.yacceleration=yacceleration;
    this.score=2500;
    this.health=25;
  }

  void move()
  {
    if (xpos<50+width/10)
    {
      xdirection=-xdirection;
      xspeed=xspeed+random(xacceleration);
    }
    if (xpos<0)
    {
      xpos=width/2;
    }
    if (xpos>width-(width/10)-50)
    {
      xdirection=-xdirection;
      xspeed=xspeed+random(xacceleration);
    }
    if (xpos>width)
    {
      xpos=width/2;
    }
    if (ypos<50)
    {
      ydirection=-ydirection;
      yspeed=yspeed+random(yacceleration);
    }
    if (ypos<-100)
    {
      ypos=height/2;
    }
    if (ypos>(height*3/4)-50)
    {
      ydirection=-ydirection;
      yspeed=yspeed+random(yacceleration);
    }
    if (ypos>height&&ypos<height*2)
    {
      ypos=height/2;
    }
    if (xspeed>maxspeed)
    {
      xacceleration=-xacceleration;
    }
    if (yspeed>maxspeed)
    {
      yacceleration=-yacceleration;
    }
    if (xspeed<minspeed)
    {
      xacceleration=-xacceleration;
    }
    if (yspeed<minspeed)
    {
      yacceleration=-yacceleration;
    }
    xpos=xpos+xspeed*xdirection;
    ypos=ypos+yspeed*ydirection;
  }

  void display()
  {
    fill(255, 0, 0);
    rect(xpos-25, ypos-50, 50, 100);
    text("health = "+health, width/2-50, 20);
  }
}

