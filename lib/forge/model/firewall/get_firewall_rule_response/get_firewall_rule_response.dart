import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_firewall_rule_response.freezed.dart';
part 'get_firewall_rule_response.g.dart';

@freezed
class GetFirewallRuleResponse with _$GetFirewallRuleResponse {
  factory GetFirewallRuleResponse({
    required FirewallRule rule,
  }) = _GetFirewallRuleResponse;

  factory GetFirewallRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFirewallRuleResponseFromJson(json);
}
