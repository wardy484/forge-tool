// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerListImpl _$$ServerListImplFromJson(Map<String, dynamic> json) =>
    _$ServerListImpl(
      servers: (json['servers'] as List<dynamic>)
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServerListImplToJson(_$ServerListImpl instance) =>
    <String, dynamic>{
      'servers': instance.servers,
    };
