import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_firewall_rule.freezed.dart';
part 'create_firewall_rule.g.dart';

@freezed
class CreateFirewallRule with _$CreateFirewallRule {
  factory CreateFirewallRule({
    required String name,
    String? ipAddress,
    required int port,
    required String type,
  }) = _CreateFirewallRule;

  factory CreateFirewallRule.fromJson(Map<String, dynamic> json) =>
      _$CreateFirewallRuleFromJson(json);
}
