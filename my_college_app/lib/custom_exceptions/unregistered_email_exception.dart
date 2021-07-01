class UnregisteredEmailException implements Exception {
  String cause;
  UnregisteredEmailException(this.cause);
  @override
  String toString() {
    return cause.toString();
  }
}
