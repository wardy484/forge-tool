import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/site/site_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'site_list.g.dart';

@riverpod
FutureOr<SiteList> siteLists(Ref ref, int serverId) async {
  return await ref.read(forgeSdkProvider).listSites(serverId);
}
