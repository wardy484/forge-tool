import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_list_notifier.g.dart';

@Riverpod()
FutureOr<ServerList> serverList(Ref ref) async {
  final forge = ref.watch(forgeSdkProvider);
  final servers = await forge.listServers();
  return servers;
}
