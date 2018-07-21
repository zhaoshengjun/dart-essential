// class
class Point {
  var x, y;
  Point(a, b) {
    x = a;
    y = b;
  }
}

// use new to create an instance
var origin = new Point(0, 0);
var aPoint = new Point(3, 4);

// another way to declar a class
class PointV2 {
  var x, y;
  PointV2(this.x, this.y);
}
