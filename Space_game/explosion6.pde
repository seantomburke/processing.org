class explosion6 extends explosion
{
  explosion6(float xpos, float ypos)
  {
    super(xpos, ypos);
  }

  void display()
  {
    if (time>1&&time<5)
    {
      fill(0, 255, 0);
      ellipse(xpos, ypos, 1000, 1000);
      increment_time();
    }
  }
}

