import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_firewall_rule_response.freezed.dart';
part 'create_firewall_rule_response.g.dart';

@freezed
class CreateFirewallRuleResponse with _$CreateFirewallRuleResponse {
  factory CreateFirewallRuleResponse({
    required FirewallRule rule,
  }) = _CreateFirewallRuleResponse;

  factory CreateFirewallRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFirewallRuleResponseFromJson(json);
}
