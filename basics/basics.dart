class Point {
  var x, y;

  Point(this.x, this.y);

  // override this method with care:
  // the == should be:
  // - reflexive: a == a
  // - transitive: a == b && b ==c, hence a == c
  // - commutative: a == b, hence b == a
  operator ==(p) => identical(this, p);
}

void main() {
  var pointA = new Point(3, 4);
  var pointB = new Point(3, 4);

  print(pointA == pointB); // return true
}
