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
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(
          key: args.key,
          initialPage: args.initialPage,
        ),
      );
    },
  };
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
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    bool initialPage = true,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            key: key,
            initialPage: initialPage,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    this.key,
    this.initialPage = true,
  });

  final Key? key;

  final bool initialPage;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, initialPage: $initialPage}';
  }
}
