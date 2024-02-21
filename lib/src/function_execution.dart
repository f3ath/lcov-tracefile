/// Function execution data, as reported by a "FNDA" line.
class FunctionExecution {
  FunctionExecution(this.name, this.count);

  /// Function name.
  final String name;

  /// Execution count.
  final int count;
}
