import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

@freezed
class Server with _$Server {
  factory Server({
    required int id,
    required int credentialId,
    required String name,
    required String region,
    required String phpVersion,
    required String databaseType,
    required String ipAddress,
    required String privateIpAddress,
    String? blackfireStatus,
    String? papertrailStatus,
    required bool revoked,
    required String createdAt,
    required bool isReady,
    required List<int> network,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
