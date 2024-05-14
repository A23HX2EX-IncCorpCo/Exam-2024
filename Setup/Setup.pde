/*------------------------------------------
 Eksamens projekt 2024 | Desktop simulation
 ---------------------
 Lavet af:
 Simon, Magnus, Rune
 Lære:
 Christian Bruhn
 ---------------------
 Vi har brugt følgende ressourcer til at
 hjælpe med opgaven, vi har brugt det til at
 danne en forståelse og har ikke copy pasted.
 
 - Phind
 - Stackoverflow
 - Processing.org
  - CodingTrain 


String state;
Calendar calendar;
//AppSuperClass appSuperclass;
LoginPage loginPage;
Clock clock;
Grid appGrid;
Desktop desktop;
Buttons buttons;

boolean[] keys = new boolean[1000000000];
boolean typing = true;
String typedLetters = "";

void setup() {
  state = "startup";
  size(960, 540);
  size(1600, 900);

  //appSuperclass = new AppSuperclass();
  appGrid = new Grid();
  loginPage = new LoginPage();
  clock = new Clock();
  calendar = new Calendar();
}

void draw() {
  println(typedLetters);

  switch(state) {
  case "startup":
    loginPage.loginWallpaper(); // Now this function exists and can be called
    break;
  case "login":
    loginPage.ProfileDisplay();
    break;
  case "Desktop":
    break;
  }
}
