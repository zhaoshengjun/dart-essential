// function
// the following functions are equivalent
twice(x) => x * 2;

twice2(x) {
  return x * 2;
}

// the following functions are equivalent

max(x, y) {
  if (x > y)
    return x;
  else
    return y;
}

max2(x, y) => (x > y) ? x : y;

maxElement(a) {
  var currentMax =
      a.isEmpty ? throw 'Maximumal element undefined for empty array' : a[0];

  for (var i = 0; i < a.length; i++) {
    currentMax = max(a[i], currentMax);
  }
  return currentMax;
}
