abstract class explosion
{
  float xpos;
  float ypos;
  int time=0;

  explosion(float xpos, float ypos)
  {
    this.xpos=xpos;
    this.ypos=ypos;
  }

  abstract void display();

  void remove()
  {
    for (int e=0; e<explosions.size()-2; e++)
    {
      if (time>5)
      {
        explosions.remove(e);
      }
    }
  }

  void increment_time()
  {
    time++;
  }
}

