import 'package:lcov_tracefile/src/branch_coverage.dart';
import 'package:lcov_tracefile/src/function_coverage.dart';
import 'package:lcov_tracefile/src/line_coverage.dart';

/// Coverage data for a source file.
class SourceFile {
  /// Source file name.
  final String name;

  /// Line coverage.
  final lines = LineCoverage();

  /// Function coverage.
  final functions = FunctionCoverage();

  /// Branch Coverage.
  final branches = BranchCoverage();

  SourceFile(this.name);
}
