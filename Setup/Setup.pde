import controlP5.*;

//------------------------------------------
//Eksamens projekt 2024 | Desktop simulation
// ---------------------
//Lavet af:
// Simon, Magnus, Rune
//Lære:
//Christian Bruhn
// ---------------------
// Vi har brugt følgende ressourcer til at
// hjælpe med opgaven, vi har brugt det til at
// danne en forståelse og har ikke copy pasted.

// - Phind
// - Stackoverflow
// - Processing.org
// - CodingTrain


String state;
Calendar calendar;
//AppSuperClass appSuperclass;
LoginPage loginPage;
Clock clock;
Grid appGrid;
Desktop desktop;
Buttons buttons;
  Textfield UsernameField;
  Textfield passwordField;
  Button createUsersButton;
  Button loginButton;
Calculator Calculator;
boolean[] keys = new boolean[1000000000];
boolean typing = true;
String typedLetters = "";
ArrayList<String> profiles = new ArrayList<>(); // Global or accessible variable
PImage loginWallpaper;
void setup() {
  state = "startup";
  size(960, 540);
  size(1600, 900);
    loginWallpaper = loadImage("loginWallpaper.png"); // Load the wallpaper image
  loginWallpaper.resize(width, height); // Resize the image to fit the window size
  fullScreen();
  loadUsers();
   // Pass 'this' as the PApplet instance

  //appSuperclass = new AppSuperclass();
  appGrid = new Grid();
  loginPage = new LoginPage(this);
  clock = new Clock();
  calendar = new Calendar();
  Calculator = new Calculator();
}

void draw() {
  println(typedLetters);
  background(loginWallpaper);
  ProfileDisplay();
  displayButtons();

  switch(state) {
  case "startup":
    loginPage.loginWallpaper(); // Now this function exists and can be called
    break;
  case "login":
    displayBackground(); // Ensure the wallpaper is still displayed
    displayProfiles(profiles); // Display the list of profiles
    loginPage.setupUI();
    break;
  case "Desktop":
    break;
  }
  Calculator.calc1(100, 100);
}
