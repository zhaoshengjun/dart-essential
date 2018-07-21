// class
class Point {
  var x, y;
  Point(this.x, this.y);

  scale(factor) => new Point(x * factor, y * factor);

  operator +(p) => new Point(x + p.x, y + p.y);
}

void main() {
  var aPoint = new Point(5, 1);
  var bPoint = new Point(3, 4);
  print((aPoint + bPoint).x);
}
