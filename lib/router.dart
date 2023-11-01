import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/settings/pages/settings_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SettingsRoute.page, initial: true, path: "/settings"),
      ];
}
