// class
class Point {
  var x, y;
  Point(this.x, this.y);

  scale(factor) => new Point(x * factor, y * factor);
}

void main() {
  var bPoint = new Point(3, 4);
  print(bPoint.scale(4).x);
}
