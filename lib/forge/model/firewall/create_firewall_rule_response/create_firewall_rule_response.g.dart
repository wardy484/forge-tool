// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_firewall_rule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFirewallRuleResponseImpl _$$CreateFirewallRuleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFirewallRuleResponseImpl(
      rule: FirewallRule.fromJson(json['rule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateFirewallRuleResponseImplToJson(
        _$CreateFirewallRuleResponseImpl instance) =>
    <String, dynamic>{
      'rule': instance.rule,
    };
