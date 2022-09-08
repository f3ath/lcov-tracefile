/// A function reference, as reported by a "FN" line.
class FunctionReference {
  /// Function name.
  final String name;

  /// Line number.
  final int line;

  FunctionReference(this.name, this.line);
}
