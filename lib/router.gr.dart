// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SettingsPage(key: args.key, initialPage: args.initialPage));
    },
    ServerListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ServerListPage());
    },
    WhitelistRoute.name: (routeData) {
      final args = routeData.argsAs<WhitelistRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WhitelistPage(key: args.key, server: args.server));
    },
    WhitelistStatusRoute.name: (routeData) {
      final args = routeData.argsAs<WhitelistStatusRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WhitelistStatusPage(
              key: args.key,
              serverId: args.serverId,
              inProgressRules: args.inProgressRules,
              deletableRules: args.deletableRules));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/settings', fullMatch: true),
        RouteConfig(SettingsRoute.name, path: '/settings'),
        RouteConfig(ServerListRoute.name, path: '/servers'),
        RouteConfig(WhitelistRoute.name, path: '/whitelist-page'),
        RouteConfig(WhitelistStatusRoute.name, path: '/whitelist-status-page')
      ];
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({Key? key, bool initialPage = true})
      : super(SettingsRoute.name,
            path: '/settings',
            args: SettingsRouteArgs(key: key, initialPage: initialPage));

  static const String name = 'SettingsRoute';
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key, this.initialPage = true});

  final Key? key;

  final bool initialPage;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, initialPage: $initialPage}';
  }
}

/// generated route for
/// [ServerListPage]
class ServerListRoute extends PageRouteInfo<void> {
  const ServerListRoute() : super(ServerListRoute.name, path: '/servers');

  static const String name = 'ServerListRoute';
}

/// generated route for
/// [WhitelistPage]
class WhitelistRoute extends PageRouteInfo<WhitelistRouteArgs> {
  WhitelistRoute({Key? key, required Server server})
      : super(WhitelistRoute.name,
            path: '/whitelist-page',
            args: WhitelistRouteArgs(key: key, server: server));

  static const String name = 'WhitelistRoute';
}

class WhitelistRouteArgs {
  const WhitelistRouteArgs({this.key, required this.server});

  final Key? key;

  final Server server;

  @override
  String toString() {
    return 'WhitelistRouteArgs{key: $key, server: $server}';
  }
}

/// generated route for
/// [WhitelistStatusPage]
class WhitelistStatusRoute extends PageRouteInfo<WhitelistStatusRouteArgs> {
  WhitelistStatusRoute(
      {Key? key,
      required int serverId,
      required List<FirewallRule> inProgressRules,
      required List<FirewallRule> deletableRules})
      : super(WhitelistStatusRoute.name,
            path: '/whitelist-status-page',
            args: WhitelistStatusRouteArgs(
                key: key,
                serverId: serverId,
                inProgressRules: inProgressRules,
                deletableRules: deletableRules));

  static const String name = 'WhitelistStatusRoute';
}

class WhitelistStatusRouteArgs {
  const WhitelistStatusRouteArgs(
      {this.key,
      required this.serverId,
      required this.inProgressRules,
      required this.deletableRules});

  final Key? key;

  final int serverId;

  final List<FirewallRule> inProgressRules;

  final List<FirewallRule> deletableRules;

  @override
  String toString() {
    return 'WhitelistStatusRouteArgs{key: $key, serverId: $serverId, inProgressRules: $inProgressRules, deletableRules: $deletableRules}';
  }
}
