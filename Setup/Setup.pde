/*------------------------------------------
 Eksamens projekt 2024 | Desktop simulation
 ---------------------
 Lavet af:
 Simon, Magnus, Rune
 Lære:
 Christian Bruhn
 ---------------------
 Vi har brugt følgende ressourcer til at
 hjælpe med opgaven, vi har brugt det til at
 danne en forståelse og har ikke copy pasted.
 
 - Phind
 - Stackoverflow
 - Processing.org
 - CodingTrain discord server
 
 ------------------------------------------*/
String state;

void setup() {
  state = "startup";
  size(960, 540);
  size(1600, 900);
  appSuperclass = new AppSuperclass();
  loginPage = new LoginPage();
  clock = new Clock();
  calendar = new Calendar();
}

void draw() {
  
  switch(state) {
    // states for login
  case "startup":
    loginPage.Wallpaper();
    
    break;
  case "Desktop":
    //loginPage.
    break;
  }
}
