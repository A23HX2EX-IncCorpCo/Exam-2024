import processing.core.PApplet;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import controlP5.*;
import java.util.ArrayList;
import java.util.List;

class LoginPage {
  PImage loginWallpaper;
  boolean startup;
  String typedLetters = "";
  boolean hasAccounts = false; // Flag to check if there are any accounts
  ControlP5 cp5;
  Textfield usernameField;
  Textfield passwordField;
  Button createAccountButton;
  Button loginButton;

  // Example accounts for demonstration
  final List<String[]> accounts = new ArrayList<>();
LoginPage() {
    // Initialize the loginWallpaper variable
    loginWallpaper = loadImage("loginWallpaper.png");
    loginWallpaper.resize(width, height);
  }

  void loginWallpaper() {
    // Display the loaded image as the background
    image(loginWallpaper, 0, 0);
  }


  void setup() {
    loginWallpaper = loadImage("loginWallpaper.png"); // Load the wallpaper image
    loginWallpaper.resize(width, height); // Resize the image to fit the window size
    fullScreen(); // Set the screen fullscreen
    loadAccounts(); // Load accounts on startup
  }
  void draw() {
    background(loginWallpaper);
    ProfileDisplay();
    displayButtons();
  }
void ProfileDisplay() {
    // Example: Displaying a simple text message as the profile display
    fill(255);
    textSize(32);
    text("Welcome to the Login Page!", width / 2, height / 4);
  }
  // Event handler for the "Create Account" button
  void controlEvent(ControlEvent theEvent) {
    if (theEvent.getController().getName().equals("Create Account")) {
      String username = usernameField.getText();
      String password = passwordField.getText();
      // Save the new account to a file
      saveAccount(username, password);
    } else if (theEvent.getController().getName().equals("Login")) {
      login(usernameField.getText(), passwordField.getText());
    }
  }

  // Function to save an account to a file
  void saveAccount(String username, String password) {
    String[] accountData = {username, password};
    accounts.add(accountData);
    // Here you would save the account to a file or database
  }

  // Function to load accounts from a file or database
  void loadAccounts() {
    // For demonstration, we're just using a static list
    // In a real application, you would load accounts from a file or database
    hasAccounts =!accounts.isEmpty();
  }

  // Function to authenticate a user
  boolean authenticate(String username, String password) {
    for (String[] account : accounts) {
      if (account[0].equals(username) && account[1].equals(password)) {
        return true;
      }
    }
    return false;
  }

  // Define the login function here
  void login(String username, String password) {
    if (authenticate(username, password)) {
      // Handle successful login
      JOptionPane.showMessageDialog(null, "Logged in successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
    } else {
      JOptionPane.showMessageDialog(null, "Invalid username or password.", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  // Display buttons based on whether there are any accounts
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
}
