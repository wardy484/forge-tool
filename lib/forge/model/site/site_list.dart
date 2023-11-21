import 'package:forge/forge/model/site/site.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_list.freezed.dart';
part 'site_list.g.dart';

@freezed
class SiteList with _$SiteList {
  const factory SiteList({
    required List<Site> sites,
  }) = _SiteInfo;

  factory SiteList.fromJson(Map<String, dynamic> json) =>
      _$SiteListFromJson(json);
}
