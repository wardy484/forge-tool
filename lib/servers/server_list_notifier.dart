import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/servers/server_list_state.dart';

final serverListNotifierProvider =
    StateNotifierProvider<ServerListNotifier, ServerListState>(
  (ref) => ServerListNotifier(
    forge: ref.watch(forgeSdkProvider),
  ),
);

class ServerListNotifier extends StateNotifier<ServerListState> {
  final ForgeSdk forge;

  ServerListNotifier({
    required this.forge,
  }) : super(const ServerListState.initial());

  Future<void> getServerList() async {
    try {
      state = const ServerListState.loading();

      final servers = await forge.listServers();

      state = ServerListState.loaded(servers);
    } catch (e) {
      state = const ServerListState.error();
    }
  }
}
