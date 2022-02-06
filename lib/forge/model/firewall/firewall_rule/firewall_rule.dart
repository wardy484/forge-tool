import 'package:freezed_annotation/freezed_annotation.dart';

part 'firewall_rule.freezed.dart';
part 'firewall_rule.g.dart';

@freezed
class FirewallRule with _$FirewallRule {
  factory FirewallRule({
    required int id,
    required String name,
    required String port,
    required String type,
    String? ipAddress,
    required String status,
    required String createdAt,
  }) = _FirewallRule;

  factory FirewallRule.fromJson(Map<String, dynamic> json) =>
      _$FirewallRuleFromJson(json);
}
