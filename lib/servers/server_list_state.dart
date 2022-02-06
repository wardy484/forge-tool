import 'package:forge/forge/model/server/server_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_list_state.freezed.dart';

@freezed
class ServerListState with _$ServerListState {
  const factory ServerListState.initial() = _Initial;
  const factory ServerListState.loading() = _Loading;
  const factory ServerListState.loaded(ServerList servers) = _Loaded;
  const factory ServerListState.error() = _Error;
}
