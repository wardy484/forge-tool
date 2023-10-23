// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_firewall_rule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFirewallRuleResponseImpl _$$GetFirewallRuleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFirewallRuleResponseImpl(
      rule: FirewallRule.fromJson(json['rule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetFirewallRuleResponseImplToJson(
        _$GetFirewallRuleResponseImpl instance) =>
    <String, dynamic>{
      'rule': instance.rule,
    };
