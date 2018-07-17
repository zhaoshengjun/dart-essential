import 'package:dart_essential/fuzzy.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

class DocSearch {
  Element _root;
  InputElement _input;
  UListElement _ul;
  FuzzySearch _fuzzy;
  Map<String, dynamic> _dict;

  static Future fromJson(Element root, String url) async {
    String json = await HttpRequest.getString(url);
    Map decoded = JSON.decode(json);
    return new DocSearch(root, decoded);
  }

  DocSearch(Element root, [Map<String, dynamic> inputDict]) {
    _root = root;
    _dict = inputDict;
    _input = _root.querySelector('input');
    _ul = _root.querySelector('ul');

    _input
      ..attributes.remove('disabled')
      ..onKeyUp.listen((_) => search(_input.value))
      ..onFocus.listen((_) => showAutocomplete());

    _ul.onClick.listen((Event e) {
      Element target = e.target;
      showDetail(target.dataset['key']);
    });

    Stream customOnClick = document.onClick.where((Event e) {
      Element target = e.target;
      return target != _input && target.parent != _ul;
    });

    customOnClick.listen((_) => hideAutocomplete());
  }

  void set dict(Map<String, dynamic> dict) {
    _dict = dict;
    if (_fuzzy == null) {
      _fuzzy = new FuzzySearch(_dict.keys.toList());
    } else {
      _fuzzy.list = _dict.keys.toList();
    }
  }

  void search(String term) {
    if (term.length > 1) {
      int start = new DateTime.now().millisecondsSinceEpoch;
      List<String> results = _fuzzy.search(_input.value.toLowerCase());
      int end = new DateTime.now().millisecondsSinceEpoch;
      print('$term: ${(end - start).toString()} ms');
      renderAutoComplete(results);
    } else {
      hideAutocomplete();
    }
  }

  void showAutocomplete() {
    _ul.style.display = 'block';
  }

  void showDetail(String key) {
    Map<String, String> info = _dict[key];
    _root.querySelector('#detail > h1').text = info['name'];
    String desc = info['desc']
    ..replaceAll('\\n\\n', '</p><p>')
    ..replaceAll('\\_', '_');
    _root.querySelector('#detail > div').innerHtml = '<p>' + desc + '</p>';
    hideAutocomplete();
  }

  void hideAutocomplete() {
    _ul.style.display = 'none';
  }

  void renderAutoComplete(List<String> list) {
    if (list.length == 0) hideAutocomplete();
    DocumentFragment frag = new DocumentFragment();
    list.forEach((String key) {
      LIElement li = new LIElement();
      li.text = _dict[key]['name'];
      li.dataset['key'] = key;
      frag.append(li);
    });
    _ul.children.clear();
    _ul.append(frag.clone(true));
    showAutocomplete();
  }


main() async {
  try {
    await DocSearch.fromJson(querySelector('body'), 'dict.json');
  } catch (e) {
    print("It's broken");
  }
}

// var obj = new FuzzySearchtermoid
