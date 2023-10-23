// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerImpl _$$ServerImplFromJson(Map<String, dynamic> json) => _$ServerImpl(
      id: json['id'] as int,
      credentialId: json['credential_id'] as int,
      name: json['name'] as String,
      region: json['region'] as String,
      phpVersion: json['php_version'] as String,
      databaseType: json['database_type'] as String,
      ipAddress: json['ip_address'] as String,
      privateIpAddress: json['private_ip_address'] as String,
      blackfireStatus: json['blackfire_status'] as String?,
      papertrailStatus: json['papertrail_status'] as String?,
      revoked: json['revoked'] as bool,
      createdAt: json['created_at'] as String,
      isReady: json['is_ready'] as bool,
      network: (json['network'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$ServerImplToJson(_$ServerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credential_id': instance.credentialId,
      'name': instance.name,
      'region': instance.region,
      'php_version': instance.phpVersion,
      'database_type': instance.databaseType,
      'ip_address': instance.ipAddress,
      'private_ip_address': instance.privateIpAddress,
      'blackfire_status': instance.blackfireStatus,
      'papertrail_status': instance.papertrailStatus,
      'revoked': instance.revoked,
      'created_at': instance.createdAt,
      'is_ready': instance.isReady,
      'network': instance.network,
    };
