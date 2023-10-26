extension ListExtensions<T> on List<T> {
  List<T> clone() {
    return List<T>.from(this);
  }
}
