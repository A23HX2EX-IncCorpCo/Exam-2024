
LoginPage loginPage;

class LoginPage {
  PImage loginWallpaper;

  LoginPage() {
  }

  void Wallpaper() {
    loginWallpaper = loadImage("loginWallpaper.png");
    loginWallpaper.resize(width, height);
    background(loginWallpaper);
  }
  
  void ProfileDisplay(){
  
  
  }
}
