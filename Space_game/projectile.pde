class projectile
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float shapesize;
  explosion explosion;

  projectile (float xpos, float ypos, float xspeed, float yspeed) 
  {
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    this.shapesize=5;
  }

  void move()
  {
    xpos=xpos-xspeed;
    ypos=ypos-yspeed;
  }

  void display() 
  {
    fill (255);
    ellipse (xpos, ypos, shapesize, shapesize);
  }

  void display2()
  {
    fill (255, 232, 142);
    rect (xpos-shapesize, ypos-shapesize, shapesize*2, shapesize*6);
  }

  int collide(Vector<enemy> enemys)
  {
    for (int i=0; i<enemys.size(); i++)
    {
       float linelength = sqrt((xpos-5-enemys.get(i).getenemy1x())*(xpos-5-enemys.get(i).getenemy1x())+(ypos-7.5-enemys.get(i).getenemy1y())*(ypos-7.5-enemys.get(i).getenemy1y()));
       if (linelength<15)
      {
        enemys.get(i).setenemyhealth(enemys.get(i).getenemyhealth()-1);
        explosions.add(new explosion6(xpos, ypos));
      }
       if (enemys.get(i).getenemyhealth()<0)
      {
        //enemys(i).setenemyay(height+100);
        enemys.get(i).setenemyhealth(0);
        int tempscore = enemys.get(i).score;
        enemys.remove(i);
        return tempscore;
      }
    }
    /*for (enemy a: enemys)
    {
      float linelength = sqrt((xpos-5-a.getenemy1x())*(xpos-5-a.getenemy1x())+(ypos-7.5-a.getenemy1y())*(ypos-7.5-a.getenemy1y()));
      
      if (a.getenemyhealth()<0)
      {
        enemys(i).setenemyay(height+100);
        enemys(i).setenemyhealth(0);
        return a.score;
      }
      if (enemys(i).getenemy1y()>height+150)
      {
        enemys.removeElement(0);
      }
    }*/
    return 0;
  }

  float getprox()
  {
    return xpos;
  }
  void setprox(float x)
  {
    xpos=x;
  }
  void setproy (float y)
  {
    ypos=y;
  }
  float getproy()
  {
    return ypos;
  }
}

