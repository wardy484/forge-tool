import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    required int id,
    required String name,
    required String username,
    required String directory,
    required bool wildcards,
    required String status,
    String? repository,
    String? repositoryProvider,
    String? repositoryBranch,
    String? repositoryStatus,
    required bool quickDeploy,
    required String projectType,
    String? app,
    required String phpVersion,
    String? appStatus,
    String? slackChannel,
    String? telegramChatId,
    String? telegramChatTitle,
    required String deploymentUrl,
    required String createdAt,
    required List<String> tags,
  }) = _SiteInfo;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}
