import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/servers/pages/server_list_page.dart';
import 'package:forge/settings/pages/settings_page.dart';
import 'package:forge/whitelist/pages/whitelist_page.dart';
import 'package:forge/whitelist/pages/whitelist_status_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SettingsRoute.page, initial: true, path: "/settings"),
        AutoRoute(page: ServerListRoute.page, path: "/servers"),
        AutoRoute(page: WhitelistRoute.page),
        AutoRoute(page: WhitelistStatusRoute.page),
      ];
}
