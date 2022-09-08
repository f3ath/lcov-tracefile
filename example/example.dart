import 'dart:io';

import 'package:lcov_tracefile/lcov_tracefile.dart';

/// This code reads the "lcov.info" and prints line coverage for each source file.
void main() {
  final scriptDir = Directory(Platform.script.path).parent.path;
  final fileName = '$scriptDir${Platform.pathSeparator}lcov.info';
  // Read the file from the disk.
  final lines = File(fileName).readAsLinesSync();
  // Build the tracefile model
  final tracefile = readTracefile(lines);
  for (final source in tracefile.sources) {
    final name = source.name;
    final linesFound = source.lines.found ?? 0;
    final linesHit = source.lines.hit ?? 0;
    final lineCoverage =
        linesFound == 0 ? 0 : (100 * linesHit / linesFound).round();
    print('File $name, line coverage $lineCoverage%');
  }
}
