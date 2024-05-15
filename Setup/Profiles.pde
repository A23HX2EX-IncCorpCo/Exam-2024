import java.util.ArrayList;


public class Profile {
    private String name;
    private String email;

    public Profile(String name, String email) {
        this.name = name;
        this.email = email;
    }

    // Getter and Setter for Name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Additional getters and setters for other properties can be added here
}

// Profiles class for managing a collection of Profile objects
public class Profiles {
    private ArrayList<Profile> profilesList = new ArrayList<>();

    public void addProfile(Profile profile) {
        profilesList.add(profile);
    }

    public Profile getProfile(int index) {
        return profilesList.get(index);
    }

    public int getNumberOfProfiles() {
        return profilesList.size();
    }

    public void main(String[] args) {
        Profiles profiles = new Profiles();

     
        Profile profile1 = new Profile("John Doe", "john.doe@example.com");
        Profile profile2 = new Profile("Jane Smith", "jane.smith@example.com");

        profiles.addProfile(profile1);
        profiles.addProfile(profile2);

        System.out.println("Number of profiles: " + profiles.getNumberOfProfiles());
        System.out.println("Profile 1: " + profiles.getProfile(0).getName() + ", Email: " + profiles.getProfile(0).getEmail());
        System.out.println("Profile 2: " + profiles.getProfile(1).getName() + ", Email: " + profiles.getProfile(1).getEmail());
    }
}
