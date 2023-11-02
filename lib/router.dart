import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/firewall_rules/pages/custom_firewall_rule_page.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/settings/pages/settings_page.dart';

part 'router.gr.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SettingsRoute.page,
          initial: true,
          path: "/settings",
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: CustomFirewallRuleRoute.page,
          path: "/firewall-rules/custom",
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
