Login login;

class Login {
  PImage loginWallpaper;
  int minute;
  int hour;
  boolean inputtingPassword;

  float inputBoxHeight;
  float inputBoxWidth;
  float inputBoxX;
  float inputBoxY;

  float regularProfileDiameter;
  float smallProfileDiameter;

  Login() {
    loginWallpaper = loadImage("loginWallpaper.png");
    loginWallpaper.resize(width, height);
    background(loginWallpaper);

    inputtingPassword = false;

    inputBoxHeight = height/20;
    inputBoxWidth = width/5;
    inputBoxX = width/2;
    inputBoxY = height/1.6;

    regularProfileDiameter = width/8;
    smallProfileDiameter = width/12;
  }

  void startup() {
    clock();

    if (mousePressed) {
      state = "loginPage";
    }
  }

  void clock() {
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
  }

  void loginPage() {
    background(loginWallpaper);
    filter(POSTERIZE, 10);
    filter(BLUR, 5);
    profiles();
    passwordInput();
  }

  void passwordInput() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(inputBoxX, inputBoxY, inputBoxWidth, inputBoxHeight, 20);

    //when u press the login thingy it will make inputtingPassword true
    if (mousePressed && (mouseX < inputBoxX + inputBoxWidth/2) && (mouseX > inputBoxX -inputBoxWidth/2) && (mouseY < inputBoxY + inputBoxHeight/2) && (mouseY > inputBoxY - inputBoxHeight/2)) {
      inputtingPassword = true;
    }
    //here if you click outside again it become false again and doesn't show the line
    if (mousePressed && !(mouseX < inputBoxX + inputBoxWidth/2) && !(mouseX > inputBoxX -inputBoxWidth/2) && !(mouseY < inputBoxY + inputBoxHeight/2) && !(mouseY > inputBoxY - inputBoxHeight/2)) {
      inputtingPassword = false;
    }
    
    //makes a small indicator of a password input
    if (inputtingPassword) {
      fill(120);
      rect(inputBoxX-inputBoxWidth/2.4, inputBoxY, inputBoxHeight/5, inputBoxHeight*0.8, 20);
    }
  }

  void profiles() {
    //Just concept for looks

    //This needs to be systematic, maybe in with classes
    //Profile images and names

    //If profile 2 or 3 is pressed they go to the center and move the profiles in one direction
    //Btw apparently it's hard to get an image onto a circle
    fill(255);
    noStroke();
    circle(width/2, height/3, regularProfileDiameter);
    textSize(width/30);
    text("profile1", width/2, height/2);

    circle(width/1.5, height/3, smallProfileDiameter);
    textSize(width/35);
    text("profile2", width/1.5, height/2.2);

    circle(width/3, height/3, smallProfileDiameter);
    textSize(width/35);
    text("profile3", width/3, height/2.2);
  }
}
