extension ListExt<T> on List<T> {
  void stableSort(int Function(T a, T b) cmp) {
    List sorter = [];
    for (var i = 0; i < length; i++) {
      sorter.add([this[i], i]);
    }
    sorter.sort((a, b) {
      var result = cmp(a[0], b[0]);
      if (result != 0) {
        return result;
      } else {
        return a[1] - b[1];
      }
    });
    for (var i = 0; i < length; i++) {
      this[i] = sorter[i][0];
    }
  }
}
