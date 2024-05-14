import processing.core.PApplet;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;

class LoginPage extends PApplet {
  PImage loginWallpaper;
  boolean startup;
  String typedLetters = "";
  boolean hasAccounts = false; // Flag to check if there are any accounts

  LoginPage() {
    size(1920, 1080); // Set the screen resolution to 1080p
    setup();
  }

  void setup() {
    Wallpaper();
    loadAccounts(); // Load accounts on startup
  }

  void draw() {
    background(loginWallpaper);
    ProfileDisplay();
    displayButtons();
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

  void displayButtons() {
    if (!hasAccounts) {
      fill(200); // Gray color for disabled button
      rect(width/2 - 100, height/2 + 100, 200, 50); // Login button
      fill(0);
      text("Login", width/2 - 50, height/2 + 150);
    } else {
      fill(255); // White color for enabled button
      rect(width/2 - 100, height/2 + 100, 200, 50); // Login button
      fill(0);
      text("Login", width/2 - 50, height/2 + 150);
    }
  }

  void loadAccounts() {
    PasswordManager pm = new PasswordManager();
    pm.loadAccounts();
    hasAccounts = pm.hasAccounts(); // Assuming hasAccounts() method exists in PasswordManager
  }

  void keyPressed() {
    if (key == BACKSPACE) {
      typedLetters = typedLetters.substring(0, typedLetters.length()-1);
    } else if (key == ENTER) {
      if (typedLetters.length() > 0) {
        login(typedLetters, ""); // Assuming login method takes username and password
      }
    } else {
      typedLetters += key;
    }
  }

  // Define the login function here
  void login(String username, String password) {
    PasswordManager pm = new PasswordManager();
    if (pm.authenticate(username, password)) {
      // Handle successful login
      JOptionPane.showMessageDialog(null, "Logged in successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
    } else {
      JOptionPane.showMessageDialog(null, "Invalid username or password.", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }
}
