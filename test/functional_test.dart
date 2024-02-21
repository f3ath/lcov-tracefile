import 'dart:io';

import 'package:lcov_tracefile/lcov_tracefile.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Empty tracefile', () {
    final tracefile = Tracefile();
    expect(tracefile.testName, isNull);
    expect(tracefile.sources, isEmpty);
  });

  test('Parser throws on invalid input', () {
    expect(() => readTracefile(['FOO:bar']), throwsFormatException);
  });

  test('Can parse the test name', () {
    final tracefile = readTracefile(['TN:my_test_name']);
    expect(tracefile.testName, equals('my_test_name'));
  });

  test('Can parse aggregated branch coverage', () {
    final tracefile =
        readTracefile(['SF:my_file', 'BRF:2', 'BRH:1', 'end_of_record']);
    expect(tracefile.sources.first.branches.found, equals(2));
    expect(tracefile.sources.first.branches.hit, equals(1));
  });

  test('Can parse an example tracefile', () {
    final lines = File('test/lcov.info').readAsLinesSync();
    final tracefile = readTracefile(lines);
    expect(tracefile.testName, isNull);
    expect(tracefile.sources.length, equals(22));
    final sourceFile = tracefile.sources.first;
    expect(sourceFile.name,
        equals('/home/f3ath/project/jessie/lib/src/algebra.dart'));

    expect(sourceFile.lines.found, equals(37));
    expect(sourceFile.lines.hit, equals(37));
    expect(sourceFile.lines.coverage.first.line, equals(42));
    expect(sourceFile.lines.coverage.first.count, equals(5));

    expect(sourceFile.functions.found, equals(25));
    expect(sourceFile.functions.hit, equals(16));
    expect(sourceFile.functions.references.length, equals(25));
    expect(sourceFile.functions.references.first.line, equals(14));
    expect(sourceFile.functions.references.first.name, equals('Algebra.eq'));
    expect(sourceFile.functions.coverage.length, equals(16));
    expect(sourceFile.functions.coverage.first.name, equals('_Strict._Strict'));
    expect(sourceFile.functions.coverage.first.count, equals(5));

    expect(sourceFile.branches.found, isNull);
    expect(sourceFile.branches.hit, isNull);
    expect(sourceFile.branches.coverage.length, equals(16));
    expect(sourceFile.branches.coverage.first.line, equals(42));
    expect(sourceFile.branches.coverage.first.block, equals(0));
    expect(sourceFile.branches.coverage.first.branch, equals(0));
    expect(sourceFile.branches.coverage.first.taken, equals(0));
    expect(sourceFile.branches.coverage.last.line, equals(98));
    expect(sourceFile.branches.coverage.last.block, equals(0));
    expect(sourceFile.branches.coverage.last.branch, equals(0));
    expect(sourceFile.branches.coverage.last.taken, equals(1));
  });
}
