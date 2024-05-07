class LoginPage {
  PImage loginWallpaper;
  boolean startup;
  LoginPage() {
    Wallpaper();
  }


  void Wallpaper() {
    loginWallpaper = loadImage("loginWallpaper.png");
    loginWallpaper.resize(width, height);
    background(loginWallpaper);
  }

  void ProfileDisplay() {
    background(50);
    
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/2, width/2, width/12, 20);
    
    fill(0);
    textSize(width/13);
    textAlign(LEFT);
    text(typedLetters, width/2-width/4.1, height/1.85);
  }
}
