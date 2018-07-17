import 'package:dart_essential/fuzzy.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

class DocSearch {
  static fromJson(Element root, String url) async {
    String json = await HttpRequest.getString(url);
    Map decoded = JSON.decode(json);
    return new DocSearch(root, decoded);
  }

  DocSearch(Element root, [Map<String, dynamic> inputDict]) {}
}

main() async {
  try {
    await DocSearch.fromJson(querySelector('body'), 'dict.json');
  } catch (e) {
    print("It's broken");
  }
}

// var obj = new FuzzySearch();
