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

  void clockFade(){
    transform: translateY(0);
transition-property: transform;
transition-duration: 1s;
transition-timing-function: ease-out;

  }
}
