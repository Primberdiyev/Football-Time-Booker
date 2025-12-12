extension DummyStringEx on String {
  String toDummyEmail() {
    return "$this@gmail.com";
  }

  String getLoginFromDummyEmail() {
    return split('@').first;
  }
}
