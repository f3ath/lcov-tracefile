import 'package:lcov_tracefile/src/function_execution.dart';
import 'package:lcov_tracefile/src/function_reference.dart';

/// Function coverage in a source file.
class FunctionCoverage {
  /// Functions found.
  int? found;

  /// Functions hit.
  int? hit;

  /// Execution counts.
  final coverage = <FunctionExecution>[];

  /// Function references.
  final references = <FunctionReference>[];
}
