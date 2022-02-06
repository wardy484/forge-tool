// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rule _$$_RuleFromJson(Map<String, dynamic> json) => _$_Rule(
      id: json['id'] as int?,
      name: json['name'] as String?,
      port: json['port'] as int?,
      type: json['type'] as String?,
      ipAddress: json['ip_address'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_RuleToJson(_$_Rule instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'port': instance.port,
      'type': instance.type,
      'ip_address': instance.ipAddress,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
