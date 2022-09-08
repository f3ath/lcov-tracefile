/// Function execution data, as reported by a "FNDA" line.
class FunctionExecution {
  /// Function name.
  final String name;

  /// Execution count.
  final int count;

  FunctionExecution(this.name, this.count);
}
