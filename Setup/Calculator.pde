class Calculator {
  char buttonValue='0';
  float firstIn;
  float secondIn;
  boolean second; //Set this to false to clear the calculator and go back to the first number.
  char math= ' ';
  String Answer;
  float result;
boolean closed;

  Calculator() {
  }


  void calc1(float x, float y) {
    if (closed){
    x=-10000;
    }
    
    if (!second) {
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
    square(x+1, y+500, 100);
    rect(x, y-100, 300, 100);
    
    fill(255, 0, 0);
    square(x+100, y+500, 100);


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
    text("x", x+50, y+550);
    text("x", x+150, y+550);

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
      if (mousePressed && (mouseX < x+100) && (mouseX > x+1)&& (mouseY < y+600)&& (mouseY > y+500)) {
      second=false;
      }
      if (mousePressed && (mouseX < x+200) && (mouseX > x+100)&& (mouseY < y+600)&& (mouseY > y+500)) {
      closed=true;
    }
    if (second) {
      secondIn=buttonValue-48;
    } else {
      firstIn=buttonValue-48;
    }
    switch(math) {
    case '+':
      result=firstIn+secondIn;
      break;
    case '-':
      result=firstIn-secondIn;
      break;
    case '*':
      result=firstIn*secondIn;
      break;
    case '/':
      result = firstIn / secondIn;
      break;
    case '^':
      result=(pow(firstIn, secondIn));
      break;
    }
    firstIn=int(firstIn);
    secondIn=int(secondIn);

    text(str(firstIn)+str(math)+str(secondIn)+"="+str(result), x+50, y-50); //the text shown on the screen
  }
}
