import 'dart:html';
import 'dart:math';

class GreetingManager {
  Random _rnd;
  HtmlElement h1 = querySelector('#output');
  GreetingManager() {
    _rnd = new Random();
  }

  String getRandomColor() {
    return _rnd.nextInt(256).toRadixString(16).padLeft(2, '0') +
        _rnd.nextInt(256).toRadixString(16).padLeft(2, '0') +
        _rnd.nextInt(256).toRadixString(16).padLeft(2, "0");
  }

  List<String> generateColors(int total) {
    return new List<String>.generate(total, (int i) => getRandomColor());
  }

  void setTextColor(String color) {
    SpanElement span = h1.querySelector('span');
    if (span != null) {
      span.style.color = color;
    }
  }

  void setText(String name) {
    h1.innerHtml = name.trim().isEmpty ? '' : 'Hello, <span>$name</span>';
  }
}

void main() {
  var gm = new GreetingManager();
  UListElement ul = querySelector('#color-select');
  gm.generateColors(5).forEach((String color) {
    LIElement elm = new LIElement();
    elm.style.backgroundColor = "#${color}";
    elm.onClick.listen((e) {
      gm.setTextColor(elm.style.backgroundColor);
      ul.querySelectorAll('li').classes.remove('selected');
      elm.classes.add('selected');
    });
    ul.append(elm);
  });

  InputElement nameInput = querySelector('#name');
  nameInput.onKeyUp.listen((Event e) {
    String name = (e.target as InputElement).value;
    print(name);
    gm.setText(name);
    LIElement selected = ul.querySelector('li.selected');
    if (selected != null) {
      gm.setTextColor(selected.style.backgroundColor);
    }
  });
}
