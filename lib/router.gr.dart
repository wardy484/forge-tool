// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateQuickActionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateQuickActionPage(),
      );
    },
    CustomFirewallRuleRoute.name: (routeData) {
      final args = routeData.argsAs<CustomFirewallRuleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomFirewallRulePage(
          key: args.key,
          server: args.server,
        ),
      );
    },
    QuickActionsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuickActionsListPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [CreateQuickActionPage]
class CreateQuickActionRoute extends PageRouteInfo<void> {
  const CreateQuickActionRoute({List<PageRouteInfo>? children})
      : super(
          CreateQuickActionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateQuickActionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomFirewallRulePage]
class CustomFirewallRuleRoute
    extends PageRouteInfo<CustomFirewallRuleRouteArgs> {
  CustomFirewallRuleRoute({
    Key? key,
    required Server server,
    List<PageRouteInfo>? children,
  }) : super(
          CustomFirewallRuleRoute.name,
          args: CustomFirewallRuleRouteArgs(
            key: key,
            server: server,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomFirewallRuleRoute';

  static const PageInfo<CustomFirewallRuleRouteArgs> page =
      PageInfo<CustomFirewallRuleRouteArgs>(name);
}

class CustomFirewallRuleRouteArgs {
  const CustomFirewallRuleRouteArgs({
    this.key,
    required this.server,
  });

  final Key? key;

  final Server server;

  @override
  String toString() {
    return 'CustomFirewallRuleRouteArgs{key: $key, server: $server}';
  }
}

/// generated route for
/// [QuickActionsListPage]
class QuickActionsListRoute extends PageRouteInfo<void> {
  const QuickActionsListRoute({List<PageRouteInfo>? children})
      : super(
          QuickActionsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickActionsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
