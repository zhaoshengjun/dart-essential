class Point {
  var x, y;
  Point(this.x, this.y);
}

class Point3D extends Point {
  var z;

  Point3D(a, b, c) : super(a, b) {
    z = c;
  }
}

void main() {
  var pointA = new Point(3, 4);
  var pointB = new Point(3, 4);

  print(pointA == pointB); // return true
}
