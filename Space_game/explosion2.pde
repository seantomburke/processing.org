class explosion2 extends explosion
{
  explosion2(float xpos, float ypos)
  {
    super(xpos, ypos);
  }
  void display()
  {
    if (time>1&&time<3)
    {
      fill(0, 255, 0);
      ellipse(xpos, ypos, 10, 10);
    }

    if (time>2&&time<4)
    {
      fill(0, 0, 255);
      ellipse(xpos, ypos, 30, 30);
    }

    if (time>3&&time<5)
    {
      fill(142, 53, 239);
      ellipse(xpos, ypos, 50, 50);
    }
    increment_time();
  }
}

