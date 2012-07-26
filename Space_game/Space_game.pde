import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int shootingtime =  10;
int delaytime = 0;
int enemytimea = 20;
int enemydelaytime = 0;
int nuketime=3000;
int health=50;
int maxhealth=100;
boolean spawnstar=false;
boolean start = false;
boolean initiate=false;
boolean canshoot = true;
boolean enemya = true;
boolean isdead = false;
boolean isdead2 = false;
boolean moveright = false;
boolean moveleft = false;
boolean spacepressed = false;
boolean acquired=false;
boolean acquired2=false;
boolean acquired3=false;
boolean acquired4=false;
ship ship;
laser laser;
Vector<projectile> projectiles;
Vector<enemy> enemys;
Vector<explosion> explosions;
Vector<star> stars;
Vector<projectileb> projectilebs;
Vector<laser> lasers;
Vector<powerup> powerups;
boolean isCollision = false;
int score=0;
PFont f;
Minim minim;
AudioPlayer backgroundmusic;
AudioPlayer enemykilled;
AudioPlayer shipkilled;
AudioPlayer shipfire;
AudioPlayer enemyfire;


//import processing.serial.*;

//Serial myPort;

void setup() {
  size (750, 500 );
  //f= loadFont("AgencyFB-Reg-36.vlw");
  minim=new Minim(this);
  //backgroundmusic=minim.loadFile("Rundas.mp3", 2048);
  shipkilled=minim.loadFile("Cartoon_Explosion.mp3");
  //backgroundmusic.loop();



  //println(Serial.list());
  //myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() 
{
  background (0);
  fill (0);
  rect (0, 0, width/10, height);
  rect (width-width/10, 0, width/10, height);
  if (start==false)
  {
    fill(255,0,0);
    //textFont(f, 48);
    text("press anywhere to play",width/4,height/2);
    if (mousePressed)
    {
      start=true;
      initiate=true;
    }
  }
  else
  {
    if (initiate)
    {
      ship = new ship (width/2, height-30);
      projectiles = new Vector<projectile>();
      projectilebs = new Vector<projectileb>();
      lasers = new Vector<laser>();
      enemys = new Vector<enemy>();
      powerups=new Vector<powerup>();
      explosions= new Vector<explosion>();
      stars= new Vector<star>();
      for (int i=0; i<125; i++)
      {
        stars.add(new star(true));
      }
      initiate = false;
    }
    //textFont(f, 24);
    fill(255, 0, 0);
    text("score =" + score, width/10+20, 20);
    text("health ="+ health, width-125-width/10, 20);
    if (enemydelaytime > enemytimea && enemya)
    {
      //Level 1
      if (nuketime>0 && nuketime<200)
      {
        enemys.add(new enemy1 (width/4, 0, 0, 2));
        enemydelaytime = 0;
      }
      if (nuketime>400 && nuketime<600)
      {
        enemys.add(new enemy1 (width*3/4, 0, 0, 2));
        enemydelaytime=0;
      }
      if (nuketime>800 &&  nuketime<1000)
      {
        enemys.add(new enemy1 (width/10, height/2, 2, 0));
        enemydelaytime=0;
      }
      if (nuketime>1200 && nuketime<1400)
      {
        enemys.add(new enemy1 (width-width/10, height/2, -2, 0));
        enemydelaytime=0;
      }
      if (nuketime>1600 && nuketime<1800)
      {
        enemys.add(new enemy1 (width/10, height*5/6, 4, 0));
        enemydelaytime=0;
      }
      if (nuketime>2000 && nuketime<2200)
      {
        enemys.add(new enemy1 (random(width+width/10)+width/10, height, 0, -2));
        enemydelaytime=0;
      }
      if (nuketime>2400 && nuketime<2500)
      {
        projectiles.removeAll(projectiles);
        enemys.removeAll(enemys);
      }
      if (nuketime>2600 && nuketime<2800)
      {
        enemys.add(new enemy1 (width/4, 0, 0, 4));
        enemydelaytime=0;
      }
      if (nuketime>3000 && nuketime<3200)
      {
        enemys.add(new enemy1 (width*3/4, 0, 0, 4));
        enemydelaytime=0;
      }
      if (nuketime>3400 && nuketime<3600)
      {
        enemys.add(new enemy1 (width/10, height/2, 4, 0));
        enemydelaytime=0;
      }
      if (nuketime>3800 && nuketime<4000)
      {
        enemys.add(new enemy1 (width-width/10, height/2, -4, 0));
        enemydelaytime=0;
      }
      if (nuketime>4200 && nuketime<4400)
      {
        enemys.add(new enemy1 (random(width+width/10)-width/10, 0, 0, 4));
        enemydelaytime=0;
      }
      if (nuketime>4600 && nuketime<4800)
      {
        enemys.add(new enemy1 (random(width+width/10)-width/10, 0, 0, 4));
        enemydelaytime=0;
      }
      if (nuketime>5000 && nuketime<5010)
      {
        enemys.removeAll(enemys);
        enemys.add(new boss1 (width/2, height/2, 1, 1));
      }
      if (health>0 && nuketime>7500 && nuketime<7750 && health>0)
      {
        //textFont(f, 48);
        text("Level 1 Clear", (width/2)-100, height/2);
      }
      if (nuketime>7500 && nuketime<7750)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
      }

      //Level 2

      if (nuketime>8000 && nuketime<8200)
      {
        enemys.add(new enemy1 (random(width+width/10)-width/10, 0, 0, 5));
        enemydelaytime=0;
      }
      if (nuketime>8400 && nuketime<8600)
      {
        enemys.add(new enemy1 (width/10, random(height)+height/3, 3, 3));
        enemydelaytime=0;
      }
      if (nuketime>8800 && nuketime<9000)
      {
        enemys.add(new enemy1 (random(width+width/10)-width/10, height, 0, -2));
        enemydelaytime=0;
      }
      if (nuketime>9500 && nuketime<9700)
      {
        enemys.add(new enemy2(width/10, random(height)+height/3, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>9900 && nuketime<10100)
      {
        enemys.add(new enemy2(width-width/10, random(height)+height/3, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>10300 && nuketime<10500)
      {
        enemys.add(new enemy2(random(width+width/10)-width/10, height, 0, -1));
        enemydelaytime=0;
      }
      if (nuketime>10800 && nuketime<10900)
      {
        projectiles.removeAll(projectiles);
        enemys.removeAll(enemys);
      }
      if (nuketime>11000 && nuketime<11200)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, 0, 0, 5));
        enemydelaytime=0;
      }
      if (nuketime>11400 && nuketime<11600)
      {
        enemys.add(new enemy1(width/10, height/2, 3, 0));
        enemydelaytime=0;
      }
      if (nuketime>11800 && nuketime<12000)
      {
        enemys.add(new enemy2(width/10, random(height), 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>12200 && nuketime<12400)
      {
        enemys.add(new enemy2(width-width/10, height/2, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>12800&&nuketime<12810)
      {
        enemys.removeAll(enemys);
        enemys.add(new boss2(width/2, height/2, 1, 1));
      }
      if (nuketime>15100 && nuketime<15250)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
      }
      if (nuketime>15100 && nuketime<15750 && health>0)
      {
        fill(0, 0, 255);
        //textFont(f, 48);
        text("Level 2 Clear", (width/2)-100, height/2);
      }

      //Level 3

      if (nuketime>16000 && nuketime<16200)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, 0, 0, 2));
        enemydelaytime=0;
      }
      if (nuketime>16400 && nuketime<16600)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, 0, 0, 2));
        enemydelaytime=0;
      }
      if (nuketime>16800 && nuketime<17000)
      {
        enemys.add(new enemy2(width/10, height*3/4, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>17200 && nuketime<17400)
      {
        enemys.add(new enemy3(width/10, 0, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>17600 && nuketime<17800)
      {
        enemys.add(new enemy3(width-width/10, 0, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>18000 && nuketime<18100)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
      }
      if (nuketime>18200 && nuketime<18400)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, random(height*2/3), 0, 4));
        enemydelaytime=0;
      }
      if (nuketime>18600 && nuketime<18800)
      {
        enemys.add(new enemy1(width/10, height/2, 4, 0));
        enemydelaytime=0;
      }
      if (nuketime>19000 && nuketime<19200)
      {
        enemys.add(new enemy2(width/10, height/2, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>19400 && nuketime<19600)
      {
        enemys.add(new enemy2(width-width/10, height/2, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>19800 && nuketime<20000)
      {
        enemys.add(new enemy3(width/10, 0, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>20200 && nuketime<20400)
      {
        enemys.add(new enemy3(width-width/10, 0, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>20600 && nuketime<20700)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
      }
      if (nuketime>20800 && nuketime<20810)
      {
        enemys.add(new boss3(width/2, height/2, -1, -1));
        enemydelaytime=0;
      }
      if (nuketime>22600 && nuketime<24000 && health>0)
      {
        projectiles.removeAll(projectiles);
        projectilebs.removeAll(projectilebs);
        enemys.removeAll(enemys);
        fill(142, 53, 239);
        //textFont(f, 48);
        text("Level 3 Clear", (width/2)-100, height/2);
      }

      //Level 4

      if (nuketime>25000 && nuketime<25200)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, random(height*2/3), 3, 3));
        enemydelaytime=0;
      }
      if (nuketime>25400 && nuketime<25600)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, height, 0, -5));
        enemydelaytime=0;
      }
      if (nuketime>25800 && nuketime<26000)
      {
        enemys.add(new enemy2(width/10, random(height*2/3), 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>26200 && nuketime<26400)
      {
        enemys.add(new enemy2(width-width/10, random(height*2/3), -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>26600 && nuketime<26800)
      {
        enemys.add(new enemy1(random(width+width/10)-width/10, 0, 0, 6));
        enemys.add(new enemy1(random(width+width/10)-width/10, height, 0, -3));
        enemys.add(new enemy2(width/10, height*2/3, 1, 1));
        enemys.add(new enemy2(width-width/10, height*3/4, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>27000 && nuketime<27100)
      {
        enemys.removeAll(enemys);
      }
      if (nuketime>27200 && nuketime<27300)
      {
        enemys.add(new enemy4(width/2, height/2, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>27400 && nuketime<27500)
      {
        enemys.add(new enemy4(width/2, height/2, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>27600 && nuketime<27800)
      {
        enemys.add(new enemy3(width/10, 0, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>28000 && nuketime<28200)
      {
        enemys.add(new enemy3(width-width/10, 0, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>28400 && nuketime<28500)
      {
        enemys.add(new enemy4(width/2, height/2, 1, 1));
        enemydelaytime=0;
      }
      if (nuketime>28600 && nuketime<28800)
      {
        enemys.add(new enemy3(width/2, 0, 1, 1));
        enemys.add(new enemy3(width/2, 0, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>29800 && nuketime<29900)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
        projectiles.removeAll(projectiles);
      }
      if (nuketime>30000 && nuketime<30010)
      {
        enemys.add(new boss4(width/2, height/2, -1, 1));
        enemydelaytime=0;
      }
      if (nuketime>33000 && nuketime<33100)
      {
        enemys.removeAll(enemys);
        projectilebs.removeAll(projectilebs);
        projectiles.removeAll(projectiles);
      }
      if (nuketime>33100 && nuketime<34000 && health>0)
      {
        fill(232, 100, 199);
        //textFont(f, 48);
        text("Final Level Clear!!", (width/2)-100, height/2);
      }

      //final boss

      if (nuketime>35000 && nuketime<35010)
      {
        enemys.add(new finalboss(width/2, height/2, 1, -1));
        enemydelaytime=0;
      }
    }

    //enemy projectiles
    for (enemy a: enemys)
    {
      if (nuketime>2400 && nuketime<5000 && nuketime%15==0)
      {
        //enemyfire=minim.loadFile("Enemyshot.mp3");
        //enemyfire.play();
        projectilebs.add(new projectileb (a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>5000 && nuketime<8000 && nuketime%20==0)
      {
        //enemyfire=minim.loadFile("Enemyshot.mp3");
        //enemyfire.play();
        projectilebs.add(new projectileb (a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>7000 && nuketime<7200 && a.getenemyhealth()>0)
      {
        lasers.add(new laser(0, height/2, 0, 2));
      }
      if (nuketime>11000 && nuketime<12700 && nuketime%20==0)
      {
        //enemyfire=minim.loadFile("Enemyshot.mp3");
        //enemyfire.play();
        projectilebs.add(new projectileb (a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>12800 && nuketime<15000 && nuketime%15==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb (a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>15000 && nuketime<15200 && a.getenemyhealth()>0)
      {
        lasers.add(new laser(0, height/2, 0, 2));
      }
      if (nuketime>18200 && nuketime<20650 && nuketime%20==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb (a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>20800 && nuketime<22500 && nuketime%15==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb(a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>22500 && nuketime<22700 && a.getenemyhealth()>0)
      {
        lasers.add(new laser(0, height/2, 0, 2));
      }
      if (nuketime>27200 && nuketime<29000 && nuketime%25==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb(a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>30000 && nuketime<34000 && nuketime%15==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb(a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>35000 && nuketime%10==0)
      {
        //      enemyfire=minim.loadFile("Enemyshot.mp3");
        //      enemyfire.play();
        projectilebs.add(new projectileb(a.getenemy1x(), a.getenemy1y()));
      }
      if (nuketime>32500 && nuketime<32700 && a.getenemyhealth()>0)
      {
        lasers.add(new laser(0, height/2, 0, 2));
      }
      if (nuketime>45000 && nuketime<45500)
      {
        lasers.add(new laser(0, height/2, 0, 2));
      }
    }

    //powerups
    if (nuketime==2500)
    {
      powerups.add(new doubleship(width/2, 20, 0, 2));
    }
    if (nuketime==7500)
    {
      powerups.removeAll(powerups);
      powerups.add(new healthpack(width/2, 20, 0, 4));
    }
    if (nuketime==15750)
    {
      powerups.removeAll(powerups);
      if (health>49)
      {
        powerups.add(new tripleship(width/2, 20, 0, 4));
      }

      if (health<50)
      {
        powerups.add(new healthpack(width/2, 20, 0, 4));
      }
    }
    if (nuketime==24000)
    {
      powerups.removeAll(powerups);
      if (health>49)
      {
        powerups.add(new doubleship(width/2, 0, 0, 4));
      }
      if (health<50)
      {
        powerups.add(new healthpack(width/2, 0, 0, 4));
      }
    }
    if (nuketime==34000)
    {
      if (health==maxhealth)
      {
        powerups.add(new pwrlaser(width/2, 0, 0, 4));
      }
      if (health<maxhealth && health>49)
      {
        powerups.add(new tripleship(width/2, 0, 0, 4));
      }
      if (health<50)
      {
        powerups.add(new healthpack(width/2, 0, 0, 4));
      }
    }

    if (delaytime > shootingtime)
    {
      canshoot = true;
      delaytime = 0;
    }

    if (projectilebs.size()>1000)
    {
      projectilebs.removeAll(projectilebs);
    }

    for (int i=0; projectiles.size() > i; i++)
    {
      int tempscore;
      tempscore = projectiles.get(i).collide(enemys);
      score += tempscore;
      if (tempscore > 0 && tempscore < 20)
      {
        enemykilled=minim.loadFile("Pow.mp3");
        enemykilled.play();
        explosions.add(new explosion1(projectiles.get(i).getprox(), projectiles.get(i).getproy()));
        projectiles.get(i).setprox(width+100);
      }
      if (tempscore > 30 && tempscore < 80)
      {
        enemykilled=minim.loadFile("Pow.mp3");
        enemykilled.play();
        explosions.add(new explosion2(projectiles.get(i).getprox(), projectiles.get(i).getproy()));
        projectiles.get(i).setprox(width+100);
      }
      if (tempscore > 85 && tempscore < 120)
      {
        enemykilled=minim.loadFile("Pow.mp3");
        enemykilled.play();
        explosions.add(new explosion3(projectiles.get(i).getprox(), projectiles.get(i).getproy()));
        projectiles.get(i).setprox(width+100);
      }
      if (tempscore > 1000)
      {
        enemykilled=minim.loadFile("Pow.mp3");
        enemykilled.play();
        explosions.add(new bossexplosion(projectiles.get(i).getprox(), projectiles.get(i).getproy()));
        projectiles.get(i).setprox(width+100);
      }
      if (tempscore > 120 && tempscore < 200)
      {
        enemykilled=minim.loadFile("Pow.mp3");
        enemykilled.play();
        explosions.add(new explosion7(projectiles.get(i).getprox(), projectiles.get(i).getproy()));
        projectiles.get(i).setprox(width+100);
      }
      projectiles.get(i).move();
      if (acquired2==false)
      {
        projectiles.get(i).display();
      }
      if (acquired2)
      {
        projectiles.get(i).display2();
      }
      if (projectiles.get(i).getproy() < -10)
      {
        projectiles.remove(i);
      }
    }
    if (ship.collide(enemys))
    {
      health=health-1;
      explosions.add(new explosion5(ship.getshipx(), ship.getshipy()));
    }
    if (ship.collide2(projectilebs))
    {
      health=health-1;
      explosions.add(new explosion5(ship.getshipx(), ship.getshipy()));
    }
    if (ship.collide3(lasers))
    {
      health=0;
    }
    if (health>maxhealth)
    {
      health=maxhealth;
    }
    if (health<1)
    {
      isdead=true;
    }
    if (isdead)
    {
      explosions.add(new explosion4(ship.getshipx(), ship.getshipy()));
      ship.setshipx(-10000);
      shipkilled.play();
    }
    if (ship.collide4(powerups))
    {
      for (powerup pwr: powerups)
      {
        pwr.setpwrx(-2000);
        println("moving powerup");
      }
      if (nuketime>5000&&nuketime<9000)
      {
        acquired3=true;
      }
      if (nuketime<5000)
      {
        acquired=true;
      }
      if (nuketime>10000 && nuketime<20000)
      {
        if (health>50)
        {
          acquired4=true;
        }
        if (health<50)
        {
          acquired3=true;
        }
      }
      if (nuketime>20000 && nuketime<30000)
      {
        if (health>49)
        {
          acquired=true;
        }
        if (health<50)
        {
          acquired3=true;
        }
      }
      if (nuketime>30000)
      {
        if (health>49 && health<maxhealth)
        {
          acquired4=true;
        }
        if (health<50)
        {
          acquired3=true;
        }
        if (health==maxhealth)
        {
          acquired2=true;
        }
      }
    }
    /*
  while (myPort.available () > 0) {
     int inByte = myPort.read();
     println(inByte);
     if (inByte<128&&inByte>120)
     {
     ship.setshipxspeed(0);
     }
     if (inByte>128 && inByte<200)
     {
     ship.setshipxspeed((inByte-124.5)/3);
     }
     if (inByte<120 && inByte>50)
     {
     ship.setshipxspeed((inByte-123.5)/3);
     }
     if (inByte==0)
     {
     spacepressed=false;
     }
     if (inByte==255)
     {
     spacepressed=true;
     }
     }
     */
    if (acquired)
    {
      ship.display2();
      if (canshoot&&spacepressed)
      {
        shipfire=minim.loadFile("Phaser fire.mp3");
        shipfire.play();
        projectiles.add(new projectile(ship.getshipx()-7, ship.getshipy(), 0, 10));
        projectiles.add(new projectile(ship.getshipx()+7, ship.getshipy(), 0, 10));
        canshoot=false;
      }
    }
    if (acquired2)
    {
      shootingtime=0;
      if (projectiles.size()>1000)
      {
        projectiles.removeAll(projectiles);
      }
    }
    if (acquired3)
    {
      health=maxhealth;
      acquired3=false;
    }
    if (acquired4)
    {
      acquired=false;
      ship.display3();
      if (canshoot&&spacepressed)
      {
        shipfire=minim.loadFile("Phaser fire.mp3");
        shipfire.play();
        projectiles.add(new projectile (ship.getshipx(), ship.getshipy(), 0, 10));
        projectiles.add(new projectile (ship.getshipx()-10, ship.getshipy(), 3, 10));
        projectiles.add(new projectile (ship.getshipx()+10, ship.getshipy(), -3, 10));
        canshoot = false;
      }
    }
    for (star s: stars)
    {
      s.move();
      s.display();
    }
    for (int i=0; enemys.size() > i; i++)
    {
      enemys.get(i).move();
      enemys.get(i).display();
    } 
    for (int i=0; explosions.size() > i; i++)
    {
      explosions.get(i).display();
      explosions.get(i).remove();
    }
    for (int i=0; projectilebs.size() > i; i++)
    {
      projectilebs.get(i).move();
      projectilebs.get(i).display();
    }
    for (laser l: lasers)

    {
      l.move();
      l.display();
    }
    for (powerup pwr: powerups)
    {
      pwr.move();
      pwr.display();
    }

    ship.move(moveleft, moveright);
    if (acquired==false && acquired4==false)
    {
      ship.display();
      if (canshoot&&spacepressed)
      {
        shipfire=minim.loadFile("Phaser fire.mp3");
        shipfire.play();
        projectiles.add(new projectile (ship.getshipx(), ship.getshipy(), 0, 10));
        canshoot = false;
      }
    }
    ship.collide(enemys);
    ship.collide2(projectilebs);
    ship.collide3(lasers);
    ship.collide4(powerups);
    delaytime++;
    enemydelaytime++;
    nuketime++;
    println(nuketime);
  }
}

//Only use when controller is not present

void keyPressed()
{
  if (keyCode==LEFT)
  {
    moveleft = true;
  }
  if (keyCode==RIGHT)
  {
    moveright = true;
  }
  if (key == ' ') 
  {
    spacepressed=true;
  }
}

void keyReleased()
{
  if (keyCode==LEFT)
  {
    moveleft=false;
  }
  if (keyCode==RIGHT)
  {
    moveright=false;
  }
  if (key==' ')
  {
    spacepressed=false;
  }
}

void stop()
{
  backgroundmusic.loop();
  //enemykilled.close();
  shipkilled.close();
  shipfire.close();
  //enemyfire.close();
  minim.stop();
  super.stop();
}

