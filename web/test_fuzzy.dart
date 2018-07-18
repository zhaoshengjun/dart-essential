import 'dart:js';
import 'package:dart_essential/fuzzy.dart';

void main() {
  FuzzySearch fuzzy = new FuzzySearch();
  context['dart_fuzzy_set_list'] = (JsArray array) {
    fuzzy.list = array.toList();
  };
  context['dart_fuzzy_search'] = fuzzy.search();
}
