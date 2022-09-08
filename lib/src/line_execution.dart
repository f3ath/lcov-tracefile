/// Line execution data, as reported by a "DA" line.
class LineExecution {
  /// Line number.
  final int line;

  /// Execution count.
  final int count;

  /// Checksum.
  final String? checksum;

  LineExecution(this.line, this.count, [this.checksum]);
}
