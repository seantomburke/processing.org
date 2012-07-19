class explosion3 extends explosion
{
  explosion3(float xpos, float ypos)
  {
    super(xpos, ypos);
  }
  void display()
  {
    if (time>1&&time<3)
    {
      fill(126, 34, 23);
      ellipse(xpos, ypos, 10, 10);
    }

    if (time>2&&time<4)
    {
      fill(235, 221, 226);
      ellipse(xpos, ypos, 30, 30);
    }

    if (time>3&&time<5)
    {
      fill(255);
      ellipse(xpos, ypos, 50, 50);
    }
    increment_time();
  }
}

