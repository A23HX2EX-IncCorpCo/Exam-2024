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
 - CodingTrain
 
 */
String state;
Calendar calendar;
//AppSuperClass appSuperclass;
LoginPage loginPage;
Clock clock;
Grid appGrid;
Desktop desktop;
Buttons buttons;

boolean[] keys = new boolean[1000000000];
boolean typing = true;
String typedLetters = "";

void setup() {
  state = "startup";
  size(960, 540);
  size(1600, 900);

  //appSuperclass = new AppSuperclass();
  appGrid = new Grid();
  loginPage = new LoginPage();
  clock = new Clock();
  calendar = new Calendar();
}
char buttonValue='0';
float firstIn;
float secondIn;
boolean second; //Set this to false to clear the calculator and go back to the first number.
char math= ' ';
float result;
void calc1(float x, float y) {
  if (!second){
  secondIn=0;
  }
  square(x+1, y+1, 100);
  square(x+100, y+1, 100);
  square(x+200, y+1, 100);
  square(x+1, y+100, 100);
  square(x+100, y+100, 100);
  square(x+200, y+100, 100);
  square(x+1, y+200, 100);
  square(x+100, y+200, 100);
  square(x+200, y+200, 100);
  square(x+1, y+300, 100);
  square(x+100, y+300, 100);
  square(x+200, y+300, 100);
  square(x+1, y+400, 100);
  square(x+100, y+400, 100);
  square(x+200, y+400, 100);
  rect(x,y-100, 300, 100);
  fill(0);
  text("1", x+50, y+50);
  text("2", x+150, y+50);
  text("3", x+250, y+50);
  text("4", x+50, y+150);
  text("5", x+150, y+150);
  text("6", x+250, y+150);
  text("7", x+50, y+250);
  text("8", x+150, y+250);
  text("9", x+250, y+250);
  text("0", x+50, y+350);
  text("+", x+150, y+350);
  text("-", x+250, y+350);
  text("*", x+50, y+450);
  text("/", x+150, y+450);
  text("^", x+250, y+450);
  if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+100)&& (mouseY > y+1)) {
    buttonValue='1';
  }
  if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+100)&& (mouseY > y+1)) {
    buttonValue='2';
  }
  if (mousePressed && (mouseX < x+300) && (mouseX > x+200)&& (mouseY < y+100)&& (mouseY > y+1)) {
    buttonValue='3';
  }
  if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+200)&& (mouseY > y+100)) {
    buttonValue='4';
  }
  if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+200)&& (mouseY > y+100)) {
    buttonValue='5';
  }
  if (mousePressed && (mouseX < x+300) && (mouseX > x+200)&& (mouseY < y+200)&& (mouseY > y+100)) {
    buttonValue='6';
  }
  if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+300)&& (mouseY > y+200)) {
    buttonValue='7';
  }
  if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+300)&& (mouseY > y+200)) {
    buttonValue='8';
  }
  if (mousePressed && (mouseX < x+300) && (mouseX > x+200)&& (mouseY < y+300)&& (mouseY > y+200)) {
    buttonValue='9';
  }
  if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+400)&& (mouseY > y+300)) {
    buttonValue='0';
  }
  if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+400)&& (mouseY > y+300)) {
    math='+';
    second=true;
  }
  if (mousePressed && (mouseX < x+300) && (mouseX > x+200)&& (mouseY < y+400)&& (mouseY > y+300)) {
    math='-';
    second=true;
  }
  if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+500)&& (mouseY > y+400)) {
    math='*';
    second=true;
  }
  if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+500)&& (mouseY > y+400)) {
    math='/';
    second=true;
  }
  if (mousePressed && (mouseX < x+300) && (mouseX > x+200)&& (mouseY < y+500)&& (mouseY > y+400)) {
    math='^';
    second=true;
  }
  if (second) {
    secondIn=buttonValue-48;
  } else {
    firstIn=buttonValue-48;
  }
  if (math=='+') {
    result=firstIn+secondIn;
  } else if (math=='-') {
    result=firstIn-secondIn;
  } else if (math=='*') {
    result=firstIn*secondIn;
  } else if (math=='/') {
    result=firstIn / secondIn;
  } else if (math=='^') {
    result=(pow(firstIn, secondIn));
  }
  firstIn=int(firstIn);
  secondIn=int(secondIn);
  result=int(result);
  text(firstIn+math+secondIn+"="+result, x+50, y-50); //the text shown on the screen
}
void draw() {
  println(typedLetters+firstIn+math+secondIn+"="+result);
  fill(255);
  calc1(100, 100);

  switch(state) {
  case "startup":
    loginPage.loginWallpaper(); // Now this function exists and can be called
    break;
  case "login":
    loginPage.ProfileDisplay();
    break;
  case "Desktop":
    break;
  }
}
