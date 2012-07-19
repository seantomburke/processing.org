abstract class enemy
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  int score;
  int health;

  enemy (float xpos, float ypos)
  {
    this.xpos=xpos;
    this.ypos=ypos;
  }

  abstract void move();
  abstract void display();

  float getenemy1x()
  {
    return xpos;
  }
  float getenemy1y()
  {
    return ypos;
  }
  int getenemyhealth()
  {
    return health;
  }
  void setenemyay(float y)
  {
    ypos=y;
  }
  void setenemyhealth(int h)
  {
    health=h;
  }
}

