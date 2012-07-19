abstract class powerup
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  float powersize;

  powerup(float xpos, float ypos, float xspeed, float yspeed)
  {
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
  }

  abstract void move();
  abstract void display();

  float getpwrx()
  {
    return xpos;
  }
  float getpwry()
  {
    return ypos;
  }
  void setpwrx(float x)
  {
    xpos=x;
  }
  void setpwry(float y)
  {
    ypos=y;
  }
}

