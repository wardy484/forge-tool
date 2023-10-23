class RuleName {
  final String name;
  final String suffix;

  RuleName({required this.name})
      : suffix = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  String toString() {
    return '$name-$suffix';
  }

  String get matcher {
    return "$name-";
  }
}
