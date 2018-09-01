import 'dart:convert';

void main() {
  var rawJson = '{ "url":"http://blah.jpg",    "id":1 }';

  var parsedJson = json.decode(rawJson);
  var model = new ImageModel.fromJson(parsedJson);
  print(model);
}

class ImageModel {
  int id;
  String url;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(jsonData) {
    id = jsonData['id'];
    url = jsonData['url'];
  }
}
