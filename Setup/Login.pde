import processing.core.PApplet;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import controlP5.*;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

class LoginPage {
  PImage loginWallpaper;
  boolean startup;
  String typedLetters = "";
  boolean HasUsers = false;
  ControlP5 cp5;
Textfield UsernameField;
Textfield passwordField;
  Button createUsersButton;
  Button loginButton;
  PApplet parent;
  ArrayList<String[]> Users = new ArrayList<>(); // Define the static list
  LoginPage(PApplet parent) {

    this.parent = parent;
    this.cp5 = new ControlP5(parent); // Initialize ControlP5 with the PApplet context
    this.loginWallpaper = parent.loadImage("loginWallpaper.png");
    this.loginWallpaper.resize(parent.width, parent.height);
  }

  void loginWallpaper() {

    image(loginWallpaper, 0, 0);
  }
  void setupUI() {
    // Setup UI elements
    if (cp5.getController("Username") == null) {
      UsernameField = cp5.addTextfield("Username")
        .setId(1)
        .setPosition((parent.width - 200) / 2, parent.height / 2 - 125)
        .setSize(200, 40)
        .setFont(parent.createFont("Arial", 20))
        .setAutoClear(false)
        .setColor(color(255, 255, 255))
        .setColorBackground(color(50))
        .setColorForeground(color(100))
        .setFocus(true)
        .setVisible(true);
    }
    if (cp5.getController("Password") == null) {
      passwordField = cp5.addTextfield("Password")
        .setId(2)
        .setPosition((parent.width - 200) / 2, parent.height / 2 - 50) // 30 pixels down from username field
        .setSize(200, 40)
        .setFont(parent.createFont("Arial", 20))
        .setAutoClear(false)
        .setColor(color(255, 255, 255)) // Optional: Set text and background color
        .setColorBackground(color(50))  // Dark background for the field
        .setColorForeground(color(100)) // Color when the field is selected
        .setFocus(true)  // Automatically focus this field
        .setVisible(true);
    }
    if (cp5.getController("Login") == null) {
      loginButton = cp5.addButton("Login")
        .setPosition((parent.width - 400) / 2, parent.height / 2 + 35) // Below the password field
        .setSize(200, 40)
        .setValue(0)
        .setFont(parent.createFont("Arial", 20))
        .setVisible(true);
    }
    if (cp5.getController("Create New User") == null) {
     createUsersButton = cp5.addButton("Create New User")
    .setPosition((parent.width - 400) / 2 + 210, parent.height / 2 + 35)
    .setSize(200, 40)
    .setValue(0)
    .setFont(parent.createFont("Arial", 20))
    .setVisible(true)
    .onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent event) {
            createUser();
        }
    });

    }
  }
}
void createUser() {
    String Username = UsernameField.getText();
    String password = passwordField.getText();
    saveUser(Username, password);
    println("New user created: " + Username); // Debug output
}
void saveUser(String username, String password) {
    String filename = "users.txt";
    PrintWriter output;
    try {
        output = new PrintWriter(new BufferedWriter(new FileWriter(filename, true))); // 'true' for append mode
        output.println(username + "," + password);
        output.close();
        println("User saved: " + username); // Debug output
    } catch (IOException e) {
        println("Error writing to file: " + e.getMessage());
    }
}

void displayBackground() {
  // Display the background image
  image(loginWallpaper, 0, 0);
}

void ProfileDisplay() {
  fill(255);
  textSize(32);
  text("Welcome to the Login Page!", width / 2, height / 4);
}
void displayProfiles(ArrayList<String> profiles) {
  // Clear any existing content
  background(0);
  fill(255);
  textSize(16);
  text("Profiles:", 20, 20); // Adjust positioning as needed

  // Iterate over the profiles and display each one
  for (int i = 0; i < profiles.size(); i++) {
    String profileName = profiles.get(i);
    text(profileName, 20, 40 + i * 20); // Adjust positioning as needed
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName().equals("Create Users")) {
    String Username = UsernameField.getText();
    String password = passwordField.getText();
    saveUsers(Username, password);
  } else if (theEvent.getController().getName().equals("Login")) {
    login(UsernameField.getText(), passwordField.getText());
  }
}


ArrayList<String[]> Users = new ArrayList<>(); // Define the static list

void saveUsers(String Username, String password) {
  String[] UsersData = {Username, password};
  Users.add(UsersData); // Use the 'Users' list
}


boolean HasUsers = false;

void loadUsers() {
  File folder = new File("Users");
  File[] listOfFiles = folder.listFiles();
  if (listOfFiles!= null && listOfFiles.length > 0) {
    HasUsers = true;
  } else {
    HasUsers = false;
  }
}

// Function to authenticate a User
boolean authenticate(String Username, String password) {
  for (String[] Users : Users) {
    if (Users[0].equals(Username) && Users[1].equals(password)) {
      return true;
    }
  }
  return false;
}

// Define the login function here
void login(String Username, String password) {
  if (authenticate(Username, password)) {
    // Handle successful login
    JOptionPane.showMessageDialog(null, "Logged in successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
  } else {
    JOptionPane.showMessageDialog(null, "Invalid Username or password.", "Error", JOptionPane.ERROR_MESSAGE);
  }
}

// Display buttons based on whether there are any Users
void displayButtons() {
  if (!HasUsers) {
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
