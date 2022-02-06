// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_firewall_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateFirewallRule _$$_CreateFirewallRuleFromJson(
        Map<String, dynamic> json) =>
    _$_CreateFirewallRule(
      name: json['name'] as String,
      ipAddress: json['ip_address'] as String?,
      port: json['port'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_CreateFirewallRuleToJson(
        _$_CreateFirewallRule instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ip_address': instance.ipAddress,
      'port': instance.port,
      'type': instance.type,
    };
