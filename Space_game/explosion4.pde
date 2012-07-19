class explosion4 extends explosion
{
  explosion4(float xpos, float ypos)
  {
    super(xpos, ypos);
  }
  void display()
  {
    if (time>1&&time<5)
    {
      fill(246, 96, 175);
      ellipse(xpos, ypos, 100, 100);
    }

    if (time>6&&time<10)
    {
      fill(255, 0, 0);
      ellipse(xpos, ypos, 300, 300);
    }

    if (time>11&&time<15)
    {
      fill(255, 255, 0);
      ellipse(xpos, ypos, 600, 600);
    }
    if (time>16&&time<25)
    {
      fill(255);
      ellipse(xpos, ypos, 1000, 1000);
    }
    increment_time();
  }
}

