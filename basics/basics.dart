class Point {
  var x, y;

  Point(this.x, this.y);

  operator ==(p) => identical(this, p);
}

void main() {
  var pointA = new Point(3, 4);
  var pointB = new Point(3, 4);

  print(pointA == pointB); // return true
}
