import 'package:lcov_tracefile/src/coverage.dart';
import 'package:lcov_tracefile/src/function_execution.dart';
import 'package:lcov_tracefile/src/function_reference.dart';

/// Function coverage in a source file.
class FunctionCoverage extends Coverage<FunctionExecution> {
  /// Function references.
  final references = <FunctionReference>[];
}
