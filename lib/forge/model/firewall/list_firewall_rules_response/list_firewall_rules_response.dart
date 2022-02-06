import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_firewall_rules_response.freezed.dart';
part 'list_firewall_rules_response.g.dart';

@freezed
class ListFirewallRulesResponse with _$ListFirewallRulesResponse {
  factory ListFirewallRulesResponse({
    required List<FirewallRule> rules,
  }) = _ListFirewallRulesResponse;

  factory ListFirewallRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFirewallRulesResponseFromJson(json);
}
