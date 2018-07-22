import 'dart:math';

class Point {
  var rho, theta;
  Point(this.rho, this.theta);
  x() => rho * cos(theta);
  y() => rho * sin(theta);
  scale(factor) => new Point(rho * factor, theta);
  operator +(p) => new Point(x() + p.x(), y() + p.y());
  static distance(p1, p2) {
    var dx = p1.x() - p2.x();
    var dy = p1.y() - p2.y();
    return sqrt(dx * dx + dy * dy);
  }
}
