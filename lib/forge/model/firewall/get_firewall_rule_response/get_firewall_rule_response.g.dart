// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_firewall_rule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFirewallRuleResponse _$$_GetFirewallRuleResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetFirewallRuleResponse(
      rule: FirewallRule.fromJson(json['rule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetFirewallRuleResponseToJson(
        _$_GetFirewallRuleResponse instance) =>
    <String, dynamic>{
      'rule': instance.rule,
    };
