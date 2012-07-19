class star
{
  float xpos;
  float ypos;
  float yspeed;
  float srad;

  star (boolean i)
  {
    xpos=random(width);
    if (i)
    {
      ypos=random(height);
    }
    else
    {
      ypos=0;
    }
    float randomrad;
    randomrad = random(2);
    if (randomrad>1)
    {
      srad=2;
      yspeed=.2;
    }
    else
    {
      srad=4;
      yspeed=.4;
    }
  }


  void move()
  {
    if (ypos>height+4)
    {
      ypos=-2;
    }
    ypos=ypos+yspeed;
  }

  void display()
  {
    fill (255);
    ellipse(xpos, ypos, srad, srad);
  }

  float getHeight()
  {
    return ypos;
  }
}

