// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuleImpl _$$RuleImplFromJson(Map<String, dynamic> json) => _$RuleImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      port: json['port'] as int?,
      type: json['type'] as String?,
      ipAddress: json['ip_address'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$RuleImplToJson(_$RuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'port': instance.port,
      'type': instance.type,
      'ip_address': instance.ipAddress,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
