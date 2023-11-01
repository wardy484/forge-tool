class FirewallRuleName {
  final String name;
  final String suffix;

  FirewallRuleName({required this.name})
      : suffix = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  String toString() {
    return '$name-$suffix';
  }

  String get matcher {
    return "$name-";
  }
}
