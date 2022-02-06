// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewall_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirewallRule _$$_FirewallRuleFromJson(Map<String, dynamic> json) =>
    _$_FirewallRule(
      id: json['id'] as int,
      name: json['name'] as String,
      port: json['port'] as String,
      type: json['type'] as String,
      ipAddress: json['ip_address'] as String?,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$_FirewallRuleToJson(_$_FirewallRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'port': instance.port,
      'type': instance.type,
      'ip_address': instance.ipAddress,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
