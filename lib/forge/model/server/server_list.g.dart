// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServerList _$$_ServerListFromJson(Map<String, dynamic> json) =>
    _$_ServerList(
      servers: (json['servers'] as List<dynamic>)
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ServerListToJson(_$_ServerList instance) =>
    <String, dynamic>{
      'servers': instance.servers,
    };
