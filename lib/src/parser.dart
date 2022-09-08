import 'package:lcov_tracefile/src/branch_execution.dart';
import 'package:lcov_tracefile/src/function_execution.dart';
import 'package:lcov_tracefile/src/function_reference.dart';
import 'package:lcov_tracefile/src/line_execution.dart';
import 'package:lcov_tracefile/src/source_file.dart';
import 'package:lcov_tracefile/src/tracefile.dart';

class Parser {
  final Tracefile tracefile;

  Parser(this.tracefile);

  /// Parses [lines] of a tracefile and updates the [tracefile] model
  /// accordingly. This method must be called for each line of the tracefile
  /// sequentially from the first to the last.
  /// Throws a [FormatException] if the [line] can not be parsed.
  parseLines(List<String> lines) => lines.forEach(parseLine);

  /// Parses a single [line] of a tracefile and updates the [tracefile]
  /// accordingly. This method must be called for each line of the tracefile
  /// sequentially from the first to the last.
  /// Throws a [FormatException] if the [line] can not be parsed.
  parseLine(String line) {
    if (line == 'end_of_record') return null;
    final parts = line.split(':');
    if (parts.length != 2) throw FormatException('Can not parse "$line"');
    getHandler(parts[0])(parts[1].split(','));
  }

  /// Routes the call to a specific method according to the [type].
  Function(List<String>) getHandler(String type) {
    switch (type) {
      case 'LH':
        return linesHit;
      case 'LF':
        return linesFound;
      case 'DA':
        return lineCoverage;
      case 'BRH':
        return branchesHit;
      case 'BRF':
        return branchesFound;
      case 'BRDA':
        return branchCoverage;
      case 'FNH':
        return functionsHit;
      case 'FNF':
        return functionsFound;
      case 'FNDA':
        return functionCoverage;
      case 'FN':
        return functionReference;
      case 'SF':
        return sourceFile;
      case 'TN':
        return testName;
    }
    throw FormatException('Invalid line type "$type"');
  }

  void testName(List<String> values) {
    tracefile.testName = values[0];
  }

  void sourceFile(List<String> values) {
    tracefile.sources.add(SourceFile(values[0]));
  }

  void linesFound(List<String> values) {
    tracefile.sources.last.lines.found = values[0].toInt();
  }

  void linesHit(List<String> values) {
    tracefile.sources.last.lines.hit = values[0].toInt();
  }

  void functionsFound(List<String> values) {
    tracefile.sources.last.functions.found = values[0].toInt();
  }

  void functionsHit(List<String> values) {
    tracefile.sources.last.functions.hit = values[0].toInt();
  }

  void functionReference(List<String> values) {
    tracefile.sources.last.functions.references.add(FunctionReference(
      values[1],
      values[0].toInt(),
    ));
  }

  void branchesFound(List<String> values) {
    tracefile.sources.last.branches.found = values[0].toInt();
  }

  void branchesHit(List<String> values) {
    tracefile.sources.last.branches.hit = values[0].toInt();
  }

  void lineCoverage(List<String> values) {
    tracefile.sources.last.lines.coverage.add(LineExecution(
      values[0].toInt(),
      values[1].toInt(),
      values.length > 2 ? values[2] : null,
    ));
  }

  void functionCoverage(List<String> values) {
    tracefile.sources.last.functions.coverage.add(FunctionExecution(
      values[1],
      values[0].toInt(),
    ));
  }

  void branchCoverage(List<String> values) {
    tracefile.sources.last.branches.coverage.add(BranchExecution(
      values[0].toInt(),
      values[1].toInt(),
      values[2].toInt(),
      values[3] == '-' ? 0 : values[3].toInt(),
    ));
  }
}

extension _ToInt on String {
  int toInt() => int.parse(this, radix: 10);
}
