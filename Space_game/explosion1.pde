class explosion1 extends explosion
{
  explosion1(float xpos, float ypos)
  {
    super(xpos, ypos);
  }

  void display()
  {
    if (time>1&&time<3)
    {
      fill(255, 255, 0);
      ellipse(xpos, ypos, 10, 10);
    }

    if (time>2&&time<4)
    {
      fill(248, 128, 23);
      ellipse(xpos, ypos, 30, 30);
    }

    if (time>3&&time<5)
    {
      fill(255, 0, 0);
      ellipse(xpos, ypos, 50, 50);
    }
    increment_time();
  }
}

