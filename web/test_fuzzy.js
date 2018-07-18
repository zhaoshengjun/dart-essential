window.onload = function () {
    let terms = [
        'str_replace',
        'strrev',
        'substr',
        'strtotime'
    ];
    window.dart_fuzzy_set_list(terms);
    let results = window.dart_fuzzy_search('srr');
    console.log(results);

    for (let i = 0; i < results.o.length; i++) {
        console.log(results.o[i]);
    }

}