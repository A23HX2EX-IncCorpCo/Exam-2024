<<<<<<< HEAD

=======
Clock clock;
Calendar calendar;
>>>>>>> 81e25045e332425c850ecfc9df18a858a35dec83
class Clock {
  int minute;
  int hour;

  Clock() {
  }
  void clockWork(int size, float x, float y) {
    minute = minute();
    hour = hour();

    fill(255);
    textSize(size);
    textAlign(CENTER);
    if (minute() < 10) {
      text(hour + ":0" + minute, x, y);
    } else {
      text(hour + ":" + minute, x, y);
    }
  }
}



class Calendar { //Rune was here
  int day = day();    // Values from 1 - 31
  int moth = month();  // Values from 1 - 12
  int year = year();   // 2003, 2004, 2005, etc.

  Calendar() {
  }
void calendarWork(int size, float x, float y)
{
  fill(255);
  textSize(size);
  textAlign(CENTER);
    text(day + "-" + moth +"-"+ year , x, y);
}
}
