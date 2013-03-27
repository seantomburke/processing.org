/** Main Rocket Game Class
 created by Sean Burke
 7/6/2011
 */
 
//final public static String source = "files/processing/RocketGame/data/";
float rocketx, rockety;   //determines rocket's position
float enemyX, enemyY;    //determines enemy's position
int delayTimer = 0;   //rockets shooting timer
int fireDelay = 10;   // length of shooting delay
int score, time;     // game time and score
double accuracy; // accuracy of shots
int startMargin = 25;    // xposition from origin
boolean checkAdd = true;   // check to see if you can shoot a projectile yet
boolean addProjectile = false; // if you can shoot, add projectile to vector
boolean start = true; // inital coniditions

Vector<Projectile> projectiles; // create new Vector for projectiles
Rocket rocket;    //create new rocket object
Enemy enemy;    //create new enemy object

void setup() {
  size(320, 240); // set up the size of your window
  frameRate(60);  // set the speed of your animation
  smooth();     //draw smooth shapes

  projectiles = new Vector<Projectile>(); // create new projectiles Vector
  rocketx = startMargin;  //set rocket to start margin
  rockety = height/2;    //set rockets yposition to half the height
  enemyX = 3*(width)/4;  //set enemy position to 75% of width
  enemyY = height/2;    //set height to half
  score = 0;            //initilize score to 0
  time = 0;            //initilize time to 0
  accuracy = 1;        //initialize accuracy to 100%
}

void draw()
{

  background(0);  
  delayTimer++;
  time++;

  if (start)  //start the initial conditions when creating objects
  { 
    rocket = new Rocket(rocketx, rockety);
    enemy = new Enemy(enemyX, enemyY, random(10), random(10));
    start = false;
  }

  if (fireDelay < delayTimer) {
    if (keyPressed) {
      if (key == ' ') {
        addProjectile = true;
        delayTimer = 0;
      }
    }
  }

  if (addProjectile) {
    projectiles.add(new Projectile(rocket.getTipX(), rocket.getTipY()));
    addProjectile = false;
    checkAdd = false;
  }

  for (Projectile p: projectiles) {
    p.move();
    p.display();
  }

  rocket.move();
  rocket.display();

  if (enemy.collide(projectiles)) {
    score++;
  }

  enemy.move();
  enemy.display();

  accuracy = (projectiles.size() == 0) ? 1: (double) score/projectiles.size();

  text("Your Score: " + score, width/2, 20);
  text("Time: " + time, 30, 20);
  text("Shots Fired: " + projectiles.size(), width - 200, 20);
  text("Accuracy: " + accuracy*100 + "%", 30, height - 20);
}

