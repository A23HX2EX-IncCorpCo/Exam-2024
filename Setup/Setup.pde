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

void setup(){
  state = "startup";
  size(960,540);
  appSuperclass = new AppSuperclass();
  desktop = new Desktop();
  login = new Login();
}

void draw(){
  switch(state){
  case "startup":
    login.startup();
    break;
  case "loginPage":
    login.loginPage();
    break;
  }
  
}
