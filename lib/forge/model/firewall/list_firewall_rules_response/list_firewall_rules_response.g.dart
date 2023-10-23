// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_firewall_rules_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListFirewallRulesResponseImpl _$$ListFirewallRulesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListFirewallRulesResponseImpl(
      rules: (json['rules'] as List<dynamic>)
          .map((e) => FirewallRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListFirewallRulesResponseImplToJson(
        _$ListFirewallRulesResponseImpl instance) =>
    <String, dynamic>{
      'rules': instance.rules,
    };
