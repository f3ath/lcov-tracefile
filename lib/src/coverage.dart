class Coverage<T extends Object> {
  /// Items found.
  int? found;

  /// Items hit.
  int? hit;

  /// Returns the percentage of items hit
  num? get percentage => switch ((found, hit)) {
        (int found, int hit) when hit > 0 => found / hit,
        (0, _) => 100,
        _ => null
      };

  final coverage = <T>[];
}
