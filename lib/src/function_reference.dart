/// A function reference, as reported by a "FN" line.
class FunctionReference {
  FunctionReference(this.name, this.line);

  /// Function name.
  final String name;

  /// Line number.
  final int line;
}
