// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteInfoImpl _$$SiteInfoImplFromJson(Map<String, dynamic> json) =>
    _$SiteInfoImpl(
      sites: (json['sites'] as List<dynamic>)
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SiteInfoImplToJson(_$SiteInfoImpl instance) =>
    <String, dynamic>{
      'sites': instance.sites,
    };
