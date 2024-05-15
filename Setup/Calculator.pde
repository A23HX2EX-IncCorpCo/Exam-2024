class Calc {
  float calc1;

  boolean sub;
  boolean add;
  boolean div;
  boolean mul;
  boolean sqr;
  boolean rot;
  String math;

  Calc() {
  }
  void calculator(float first, float second, float x, float y) {
    int i = 1;
    calc1=0;
    if (sub) {
      math="-";
      calc1=first-second;
    } else
    if (add) {
      math="+";
      calc1=first+second;
    } else
    if (div) {
      math=":";
      calc1=first/second;
    } else
    if (mul) {
      math="*";
      calc1=first*second;
    } else if (sqr) {
      math="^";
      calc1=first;
      while ( i <second ) {
        i++;
        calc1=calc1+first;
      }
    } else if (rot) {
      math="√";
    }



    text((first+math+second), x, y);
    if (rot) {
      text((first+"√"+second), x+50, y);
    } else {
      text((calc1), x+50, y);
    }
  }
}
