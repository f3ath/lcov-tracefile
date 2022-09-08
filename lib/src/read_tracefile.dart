import 'package:lcov_tracefile/src/parser.dart';
import 'package:lcov_tracefile/src/tracefile.dart';

/// Reads a new [Tracefile] from [lines].
Tracefile readTracefile(List<String> lines) {
  final tracefile = Tracefile();
  Parser(tracefile).parseLines(lines);
  return tracefile;
}
