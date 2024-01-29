Login login;



class Login{
  PImage loginWallpaper;
  
  Login(){
    loginWallpaper = loadImage("loginWallpaper.png");
    background(loginWallpaper);
  }
  
  void startup(){
    print("hello world");
  }
}
