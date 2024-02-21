import 'package:lcov_tracefile/lcov_tracefile.dart';
import 'package:lcov_tracefile/src/coverage.dart';

/// Coverage data for a source file.
class SourceFile {
  SourceFile(this.name);

  /// Source file name.
  final String name;

  /// Line coverage.
  final lines = Coverage<LineExecution>();

  /// Function coverage.
  final functions = FunctionCoverage();

  /// Branch Coverage.
  final branches = Coverage<BranchExecution>();
}
