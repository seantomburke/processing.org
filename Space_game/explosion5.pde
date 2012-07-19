class explosion5 extends explosion
{
  explosion5(float xpos, float ypos)
  {
    super(xpos, ypos);
  }

  void display()
  {
    if (time>1&&time<3)
    {
      fill(255, 255, 0);
      ellipse(xpos, ypos, 50, 50);
    }
    increment_time();
  }
}

