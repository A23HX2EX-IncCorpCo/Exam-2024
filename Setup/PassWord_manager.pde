import controlP5.*;

ControlP5 cp5;
Textfield usernameField;
Textfield passwordField;
Button createAccountButton;
Button loginButton;

void setup() {
 size(600, 400);
 cp5 = new ControlP5(this);
  
 // Create text fields for username and password
 usernameField = cp5.addTextfield("Username")
                     .setPosition(width/3,height/5)
                     .setSize(200, 40)
                     .setFont(createFont("Arial", 14))
                     .setFocus(true)
                     .setColor(color(255, 255, 255))
                     .setColorBackground(color(0, 0, 0))
                     .setColorForeground(color(255, 255, 255))
                     .setColorActive(color(255, 255, 255))
                     .setColorLabel(color(255, 255, 255))
                     .setColorCursor(color(255, 255, 255))
                     .setColorValueLabel(color(255, 255, 255));
  
 passwordField = cp5.addTextfield("Password")
                     .setPosition(width/3, height/2.75)
                     .setSize(200, 40)
                     .setFont(createFont("Arial", 14))
                     .setFocus(true)
                     .setColor(color(255, 255, 255))
                     .setColorBackground(color(0, 0, 0))
                     .setColorForeground(color(255, 255, 255))
                     .setColorActive(color(255, 255, 255))
                     .setColorLabel(color(255, 255, 255))
                     .setColorCursor(color(255, 255, 255))
                     .setColorValueLabel(color(255, 255, 255));
  
 // Create buttons for account creation and login
 createAccountButton = cp5.addButton("Create Account")
                           .setPosition(width/3, height/1.825)
                           .setSize(100, 40);
  
 loginButton = cp5.addButton("Login")
                   .setPosition(width/2, height/1.825)
                   .setSize(100, 40);
}

void draw() {
 background(0);
}

// Event handler for the "Create Account" button
void controlEvent(ControlEvent theEvent) {
 if (theEvent.getController().getName().equals("Create Account")) {
    String username = usernameField.getText();
    String password = passwordField.getText();
    // Save the new account to a file using PrintWriter
    saveAccount(username, password);
 } else if (theEvent.getController().getName().equals("Login")) {
    // Implement login logic here
 }
}

// Function to save an account to a file using PrintWriter
void saveAccount(String username, String password) {
 try {
    // Create a PrintWriter object
    PrintWriter output = createWriter("data/" + username + ".txt");
    
    // Write the username and password to the file
    output.println("username:"+username);
    output.println("password:"+password);
    
    // Always close the PrintWriter to ensure the data is saved and resources are freed
    output.flush();
    output.close();
 } 
 catch (Exception e) {
    println("Error saving account: " + e);
 }
}
