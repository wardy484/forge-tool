// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteInfoImpl _$$SiteInfoImplFromJson(Map<String, dynamic> json) =>
    _$SiteInfoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      directory: json['directory'] as String,
      wildcards: json['wildcards'] as bool,
      status: json['status'] as String,
      repository: json['repository'] as String?,
      repositoryProvider: json['repository_provider'] as String?,
      repositoryBranch: json['repository_branch'] as String?,
      repositoryStatus: json['repository_status'] as String?,
      quickDeploy: json['quick_deploy'] as bool,
      projectType: json['project_type'] as String,
      app: json['app'] as String?,
      phpVersion: json['php_version'] as String,
      appStatus: json['app_status'] as String?,
      slackChannel: json['slack_channel'] as String?,
      telegramChatId: json['telegram_chat_id'] as String?,
      telegramChatTitle: json['telegram_chat_title'] as String?,
      deploymentUrl: json['deployment_url'] as String,
      createdAt: json['created_at'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SiteInfoImplToJson(_$SiteInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'directory': instance.directory,
      'wildcards': instance.wildcards,
      'status': instance.status,
      'repository': instance.repository,
      'repository_provider': instance.repositoryProvider,
      'repository_branch': instance.repositoryBranch,
      'repository_status': instance.repositoryStatus,
      'quick_deploy': instance.quickDeploy,
      'project_type': instance.projectType,
      'app': instance.app,
      'php_version': instance.phpVersion,
      'app_status': instance.appStatus,
      'slack_channel': instance.slackChannel,
      'telegram_chat_id': instance.telegramChatId,
      'telegram_chat_title': instance.telegramChatTitle,
      'deployment_url': instance.deploymentUrl,
      'created_at': instance.createdAt,
      'tags': instance.tags,
    };
