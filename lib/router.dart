import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/servers/pages/server_list_page.dart';
import 'package:forge/settings/pages/settings_page.dart';
import 'package:forge/whitelist/pages/whitelist_page.dart';
import 'package:forge/whitelist/pages/whitelist_status_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SettingsPage, initial: true, path: "/settings"),
    AutoRoute(page: ServerListPage, path: "/servers"),
    AutoRoute(page: WhitelistPage),
    AutoRoute(page: WhitelistStatusPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
