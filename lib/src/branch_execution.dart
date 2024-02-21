/// Branch execution data, as reported by a "BRDA" line.
class BranchExecution {
  BranchExecution(this.line, this.block, this.branch, this.taken);

  /// line number.
  final int line;

  /// Block number
  final int block;

  /// Branch number.
  final int branch;

  /// The number of times the branch was taken.
  final int taken;
}
