class Projectile {
  float xpos, ypos;
  int projectileSpeed = 30;
  int laserwidth = 20;
  int laserheight = 5;

  Projectile(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void move() {
    this.xpos += projectileSpeed;
  }

  boolean isOutside() {
    return (xpos > width);
  }

  void display() {
    fill(#FF0000);
    rect(xpos, ypos, laserwidth, laserheight);
  }

  String toString() {
    return "Projectile: " + xpos + " " + ypos;
  }
}

