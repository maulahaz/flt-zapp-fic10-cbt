class ExceptionHandler implements Exception {
  final String message;

  ExceptionHandler({this.message = "Server error occurred"});
}