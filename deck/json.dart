import 'dart:convert';

void main() {
  var rawJson = '{ "url":"http://blah.jpg",    "id":1 }';

  var parsedJson = json.decode(rawJson);
  print(parsedJson);
}
