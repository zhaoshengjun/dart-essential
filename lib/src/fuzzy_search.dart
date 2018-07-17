part of fuzzy;

class FuzzySearch {
  List<String> list;

  FuzzySearch(this.list);

  List<String> search(String term) {
    List<String> results = [];
    if (term.isEmpty) {
      return [];
    }

    List<String> result = list.where((String key) {
      int ti = 0;

      for (int si = 0; si < key.length; si++) {
        if (term[ti] == key[si]) {
          ti++;
          if (ti == term.length) {
            return true;
          }
        }
        return false;
      }
    }).toList(growable: false);

    result.sort((String a, String b) {
      if (a.length > b.length) {
        return 1;
      } else if (a.length == b.length) {
        return 0;
      }
      return -1;
    });
    return result;
  }
}
