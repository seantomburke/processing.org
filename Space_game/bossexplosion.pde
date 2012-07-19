class bossexplosion extends explosion
{
  bossexplosion(float xpos, float ypos)
  {
    super(xpos, ypos);
  }
  void display()
  {
    if (time>1&&time<5)
    {
      fill(246, 96, 175);
      ellipse(xpos, ypos, 100, 100);
      ellipse(200, 200, 100, 100);
      ellipse(400, 200, 100, 100);
      ellipse(600, 200, 100, 100);
    }

    if (time>6&&time<10)
    {
      fill(255, 0, 0);
      ellipse(xpos, ypos, 300, 300);
      ellipse(200, 200, 300, 300);
      ellipse(400, 200, 300, 300);
      ellipse(600, 200, 300, 300);
    }

    if (time>11&&time<15)
    {
      fill(255, 255, 0);
      ellipse(xpos, ypos, 600, 600);
      ellipse(200, 200, 600, 600);
      ellipse(400, 200, 600, 600);
      ellipse(600, 200, 600, 600);
    }
    if (time>16&&time<25)
    {
      fill(255);
      ellipse(xpos, ypos, 1000, 1000);
      ellipse(200, 200, 1000, 1000);
      ellipse(400, 200, 1000, 1000);
      ellipse(600, 200, 1000, 1000);
    }
    if (time>26&&time<75)
    {
      fill(255);
      ellipse(width/2, height/2, 100, 100);
    }
    if (time>76&&time<125)
    {
      fill(255, 0, 0);
      ellipse(width/2, height/2, 300, 300);
    }
    if (time>126&&time<175)
    {
      fill(255, 255, 0);
      ellipse(width/2, height/2, 600, 600);
    }
    if (time>176&&time<225)
    {
      fill(255);
      ellipse(width/2, height/2, 1000, 1000);
    }
    increment_time();
  }
}

