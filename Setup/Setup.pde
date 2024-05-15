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

boolean[] keys = new boolean[1000000000];
boolean typing = true;
String loginMessage = "";
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
}
void showDesktop() {
    background(255); // Set a plain background or load a desktop wallpaper
    text("Welcome to your Desktop", width / 2, height / 2);
    // Add more desktop-specific UI elements and functionality here
}

void draw() {
  println(typedLetters);
  background(loginWallpaper);
  ProfileDisplay();
  displayButtons();

  switch(state) {
  case "startup":
    loginPage.loginWallpaper(); // Now this function exists and can be called
            println("Welcome to the application! Please log in.");
            break;
        case "login":
            displayBackground();
            displayProfiles(profiles);
            loginPage.setupUI();
            // Display the status message on the screen
            fill(0); // Set text color to black (or any other color)
            textSize(24); // Set text size
            textAlign(CENTER, CENTER); // Center align the text
            text(loginMessage, width / 2, height / 2 + 150); // Display message below login button
            break;
        case "Desktop":
            showDesktop(); // Function to render the desktop view
            break;
    }
}
