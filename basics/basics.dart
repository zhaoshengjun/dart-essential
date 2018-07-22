import 'dart:math';

class Point {
  final rho, theta;

  Point(a, b)
      : rho = sqrt(a * a + b * b),
        theta = atan(a / b);

  get x => rho * cos(theta);
  get y => rho * sin(theta);
  scale(factor) => new Point(x * factor, y * factor);
  operator +(p) => new Point(x + p.x, y + p.y);

  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var pointA = new Point(3, 4);
  var pointB = pointA.scale(5);
  print(pointA.x);
  print(pointB.x);
}
