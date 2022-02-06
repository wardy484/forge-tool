import 'package:forge/forge/model/server/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_list.freezed.dart';
part 'server_list.g.dart';

@freezed
class ServerList with _$ServerList {
  factory ServerList({
    required List<Server> servers,
  }) = _ServerList;

  factory ServerList.fromJson(Map<String, dynamic> json) =>
      _$ServerListFromJson(json);
}
