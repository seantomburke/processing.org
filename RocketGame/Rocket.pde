class Rocket {

  float xpos, ypos;
  int rocketSpeed = 5;
  PImage rocketImage;

  Rocket(float xconstruct, float yconstruct)
  {
    this.xpos = xconstruct;
    this.ypos = yconstruct;
    this.rocketImage = loadImage( "rocket.png");
  }

  void move() {
    if (mouseY < height/2) {
      ypos -= rocketSpeed;
    }

    if (mouseY > height/2) {
      ypos += rocketSpeed;
    }

    if (mouseX < width/2) {
      xpos -= rocketSpeed;
    }

    if (mouseX > width/2) {
      xpos += rocketSpeed;
    }

  if (ypos > height - rocketImage.height) {
    ypos = height-rocketImage.height;
  }

  if (ypos < 0) {
    ypos = 0;
  }

  if (xpos > width - rocketImage.width) {
    xpos = width - rocketImage.width;
  }

  if (xpos < 0) { 
    xpos = 0;
  }
}

void display() {
  image(rocketImage, xpos, ypos);
}

float getTipY() {
  return ypos + rocketImage.height/2;
}

float getTipX() {
  return xpos + rocketImage.width;
}

}
