class Desktop {
  float appSize = height/10;
  float x;
  float y;
  Desktop() {
  }

  void display() {
    background(100, 100, 100);
    grid(1);
    app(x, y);
  }

  void app(float x, float y) {
    square(appSize, x, y );
  }

  void grid(int placement) {

    switch(placement) {
    case 1:
    }
  }
  
  void top(){
  
  }
  void appBar(){
  
  }
}
