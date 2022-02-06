// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_firewall_rules_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListFirewallRulesResponse _$$_ListFirewallRulesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListFirewallRulesResponse(
      rules: (json['rules'] as List<dynamic>)
          .map((e) => FirewallRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListFirewallRulesResponseToJson(
        _$_ListFirewallRulesResponse instance) =>
    <String, dynamic>{
      'rules': instance.rules,
    };
