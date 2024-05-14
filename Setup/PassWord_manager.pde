import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

class PasswordManager {
  boolean hasAccounts() {
    File folder = new File("data");
    File[] listOfFiles = folder.listFiles();
    return listOfFiles!= null && listOfFiles.length > 0;
  }

  void saveAccount(String username, String password) {
    try {
      File file = new File("data/" + username + ".txt");
      FileWriter writer = new FileWriter(file);
      writer.write("username:" + username);
      writer.write("\npassword:" + password);
      writer.close();
      System.out.println("Account saved successfully.");
    } catch (IOException e) {
      System.out.println("Error saving account: " + e.getMessage());
    }
  }

  void loadAccounts() {
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
      System.out.println("Error loading accounts: " + e.getMessage());
    }
  }

  boolean authenticate(String username, String password) {
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
            if (storedUsername.equals(username) && storedPassword.equals(password)) {
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
