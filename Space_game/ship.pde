class ship {

  float xspeed=0;
  float yspeed=0;
  float xpos;
  float ypos;

  ship(float xpos, float ypos) {
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
  }

  void move(boolean moveleft, boolean moveright)
  {
    if (moveleft)
    {
      xspeed=-5;
    }
    if (moveright)
    {
      xspeed=5;
    }
    if (xpos<20 && xpos>-80)
    {
      xpos=20;
    }
    if (xpos>width-20)
    {
      xpos =width-20;
    }
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
    xspeed=0;
    yspeed=0;
  }

  void display2()
  {
    fill(255);
    triangle (xpos-14, ypos+14, xpos-7, ypos-14, xpos, ypos+14);
    triangle (xpos+7, ypos-14, xpos+14, ypos+14, xpos, ypos+14);
  }

  void display()
  {
    fill (255);
    triangle (xpos-15, ypos+15, xpos, ypos-15, xpos+15, ypos+15);
  }

  void display3()
  {
    fill(255);
    triangle (xpos-5, ypos+15, xpos, ypos-15, xpos+5, ypos+15);
    triangle (xpos-15, ypos+15, xpos-10, ypos, xpos-5, ypos+15);
    triangle (xpos+15, ypos+15, xpos+10, ypos, xpos+5, ypos+15);
  }

  boolean collide(Vector<enemy> enemys)
  {
    for (int i=0; i<enemys.size(); i++)
    {
      float linelength = sqrt((xpos-5-enemys.get(i).getenemy1x())*(xpos-5-enemys.get(i).getenemy1x())+(ypos-7.5-enemys.get(i).getenemy1y())*(ypos-7.5-enemys.get(i).getenemy1y()));
      if (linelength<15)
      {
        return true;
      }
      if (enemys.get(i).getenemy1y()>height+100)
      {
        enemys.remove(i);
      }
    }
    return false;
  }

  boolean collide2(Vector<projectileb> projectilebs)
  {
    for (int i=0; projectilebs.size() > i; i++)
    {
      float linelengthb = sqrt((xpos-5-projectilebs.get(i).getprobx())*(xpos-5-projectilebs.get(i).getprobx())+(ypos-7.5-projectilebs.get(i).getproby())*(ypos-7.5-projectilebs.get(i).getproby()));
      if (linelengthb<20)
      {
        return true;
      }
      if (projectilebs.get(i).getproby()>height)
      {
        projectilebs.remove(i);
      }
    }
    return false;
  }

  boolean collide3(Vector<laser> lasers)
  {
    for (laser l: lasers)
    {
      float linelength = sqrt((xpos-5-l.getlaserx())*(xpos-5-l.getlaserx())+(ypos-7.5-l.getlasery())*(ypos-7.5-l.getlasery()));
      if (linelength<1000)
      {
        return true;
      }
    }
    return false;
  }

  boolean collide4(Vector<powerup> powerups)
  {
    for (powerup pwr: powerups)
    {
      float linelength= sqrt((xpos-pwr.getpwrx()+10)*(xpos-pwr.getpwrx()+10)+(ypos-pwr.getpwry()+10)*(ypos-pwr.getpwry()+10));
      if (linelength<45)
      {
        return true;
      }
    }
    return false;
  }

  float getshipx()
  {
    return xpos;
  }
  float getshipy()
  {
    return ypos;
  }
  void setshipx(float x)
  {
    xpos=x;
  }
  void setshipxspeed(float xx)
  {
    xspeed=xx;
  }
}

