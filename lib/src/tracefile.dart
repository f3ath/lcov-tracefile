import 'package:lcov_tracefile/src/source_file.dart';

/// A tracefile model.
class Tracefile {
  /// The test name.
  String? testName;

  /// Source files.
  final sources = <SourceFile>[];
}
