class User {
 String userName;
 String profilePicture;
 String password;
 String grid;
 String theme;

 User(String userName, String profilePicture, String password, String grid, String theme) {
    this.userName = userName;
    this.profilePicture = profilePicture;
    this.password = password;
    this.grid = grid;
    this.theme = theme;
 }

 @Override
 public String toString() {
    return "User_Name: " + userName + "\n" +
           "User_ProfilePicture: " + profilePicture + "\n" +
           "Password: " + password + "\n" +
           "Grid: " + grid + "\n" +
           "Themes: " + theme;
 }
}
import java.io.*;
import java.util.*;

void saveUser(User user) {
 try {
    FileWriter fileWriter = new FileWriter("users.txt", true); // 'true' for append mode
    BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
    bufferedWriter.write(user.toString());
    bufferedWriter.newLine(); // Adds a new line after each user
    bufferedWriter.close();
 } catch (IOException e) {
    e.printStackTrace();
 }
}

ArrayList<User> loadUsers() {
 ArrayList<User> users = new ArrayList<User>();
 try {
    File file = new File("users.txt");
    if (file.exists()) {
      Scanner scanner = new Scanner(file);
      while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        // Assuming the format is consistent and each user's information is on separate lines
        // You might need to adjust this parsing logic based on your actual file format
        String[] parts = line.split(": ");
        if (parts.length >= 5) {
          String userName = parts[1];
          String profilePicture = parts[3];
          String password = parts[5];
          String grid = parts[7];
          String theme = parts[9];
          users.add(new User(userName, profilePicture, password, grid, theme));
        }
      }
      scanner.close();
    }
 } catch (FileNotFoundException e) {
    e.printStackTrace();
 }
 return users;
}
