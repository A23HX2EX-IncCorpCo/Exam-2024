import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

class PasswordManager {
  boolean hasUsers() {
    File folder = new File("data");
    File[] listOfFiles = folder.listFiles();
    return listOfFiles!= null && listOfFiles.length > 0;
  }

  void saveUsers(String Username, String password) {
    try {
      File file = new File("data/" + Username + ".txt");
      FileWriter writer = new FileWriter(file);
      writer.write("Username:" + Username);
      writer.write("\npassword:" + password);
      writer.close();
      System.out.println("Users saved successfully.");
    } catch (IOException e) {
      System.out.println("Error saving Users: " + e.getMessage());
    }
  }
  void loadUsers() {
    try {
      File folder = new File("data");
      File[] listOfFiles = folder.listFiles();
      if (listOfFiles!= null) {
        for (File file : listOfFiles) {
          if (file.isFile()) {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
              String line = scanner.nextLine();
              System.out.println(line);
            }
            scanner.close();
          }
        }
      }
    } catch (IOException e) {
      System.out.println("Error loading Users: " + e.getMessage());
    }
  }

  boolean authenticate(String Username, String password) {
    try {
      File folder = new File("data");
      File[] listOfFiles = folder.listFiles();
      if (listOfFiles!= null) {
        for (File file : listOfFiles) {
          if (file.isFile()) {
            Scanner scanner = new Scanner(file);
            String storedUsername = scanner.nextLine().split(":")[1];
            String storedPassword = scanner.nextLine().split(":")[1];
            scanner.close();
            if (storedUsername.equals(Username) && storedPassword.equals(password)) {
              return true; // Credentials match
            }
          }
        }
      }
    } catch (IOException e) {
      System.out.println("File not found: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return false; // Credentials do not match
  }
}
