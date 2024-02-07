Login login;

class Login {
  PImage loginWallpaper;
  int minute;
  int hour;

  Login() {
    loginWallpaper = loadImage("loginWallpaper.png");
    loginWallpaper.resize(width, height);
  }

  void startup() {
    background(loginWallpaper);

    minute = minute();
    hour = hour();

    fill(255);
    textSize(150);
    textAlign(CENTER);
    if (minute() < 10) {
      text(hour + ":0" + minute, width/2, height/2);
    } else {
      text(hour + ":" + minute, width/2, height/2);
    }
    
    if(mousePressed){
      state = "loginPage";
    }
  }
  
  void loginPage(){
    background(loginWallpaper);
    filter(POSTERIZE, 10);
    filter(BLUR, 5);
    profiles();
    passwordInput();
  }
  
  void passwordInput(){
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/1.7, width/5, height/20, 20);
  }
  
  void profiles(){
    //Just concept for looks
    
    //This needs to be systematic, maybe in with classes
    //Profile images and names
    
    //If profile 2 or 3 is pressed they go to the center and move the profiles in one direction
    //Btw apparently it's hard to get an image onto a circle 
    noStroke();
    circle(width/2, height/3, width/8);
    textSize(width/30);
    text("profile1", width/2, height/2);
    
    circle(width/1.5, height/3, width/12);
    textSize(width/35);
    text("profile2", width/1.5, height/2.2);
    
    circle(width/3, height/3, width/12);
    textSize(width/35);
    text("profile3", width/3, height/2.2);
  }
}
