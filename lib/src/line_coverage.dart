import 'package:lcov_tracefile/src/line_execution.dart';

/// Line coverage in a source file.
class LineCoverage {
  /// Lines found.
  int? found;

  /// Lines hit.
  int? hit;

  /// Execution counts.
  final coverage = <LineExecution>[];
}
