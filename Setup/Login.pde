class LoginPage{
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
  }
}
