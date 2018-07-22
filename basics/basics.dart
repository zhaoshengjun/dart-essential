import 'dart:math';

class Point {
  var rho, theta;
  Point(a, b) {
    rho = sqrt(a * a + b * b);
    theta = atan(a / b);
  }
  get x => rho * cos(theta);
  get y => rho * sin(theta);
  set x(newX) {
    rho = sqrt(newX * newX + y * y);
    theta = acos(newX / rho);
  }

  set y(newY) {
    rho = sqrt(x * x + newY * newY);
    theta = asin(newY / rho);
  }

  scale(factor) => new Point(rho * factor, theta);
  operator +(p) => new Point(x() + p.x(), y() + p.y());
  static distance(p1, p2) {
    var dx = p1.x() - p2.x();
    var dy = p1.y() - p2.y();
    return sqrt(dx * dx + dy * dy);
  }
}
