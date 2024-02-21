import 'package:lcov_tracefile/src/parser.dart';
import 'package:lcov_tracefile/src/tracefile.dart';

/// Reads a new [Tracefile] from [lines].
Tracefile readTracefile(List<String> lines) {
  final tracefile = Tracefile();
  final parser = Parser(tracefile);
  lines.forEach(parser.parseLine);
  return tracefile;
}
