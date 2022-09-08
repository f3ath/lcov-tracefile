import 'package:lcov_tracefile/src/branch_execution.dart';

/// Branch coverage in a source file.
class BranchCoverage {
  /// Branches found.
  int? found;

  /// Branches hit.
  int? hit;

  /// Execution counts.
  final coverage = <BranchExecution>[];
}
