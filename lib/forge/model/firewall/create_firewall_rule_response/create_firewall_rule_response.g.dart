// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_firewall_rule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateFirewallRuleResponse _$$_CreateFirewallRuleResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateFirewallRuleResponse(
      rule: FirewallRule.fromJson(json['rule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreateFirewallRuleResponseToJson(
        _$_CreateFirewallRuleResponse instance) =>
    <String, dynamic>{
      'rule': instance.rule,
    };
