sealed class ErrorWithMessage extends Error {
  final String message;

  ErrorWithMessage(this.message);

  @override
  String toString() {
    return '[$runtimeType] $message';
  }
}

class UnsupportedScheme extends ErrorWithMessage {
  UnsupportedScheme(super.message);
}
