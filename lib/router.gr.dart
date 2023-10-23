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
    ServerListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServerListPage(),
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
    WhitelistRoute.name: (routeData) {
      final args = routeData.argsAs<WhitelistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WhitelistPage(
          key: args.key,
          server: args.server,
          ports: args.ports,
          skipInput: args.skipInput,
        ),
      );
    },
    WhitelistStatusRoute.name: (routeData) {
      final args = routeData.argsAs<WhitelistStatusRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WhitelistStatusPage(
          key: args.key,
          serverId: args.serverId,
          inProgressRules: args.inProgressRules,
          deletableRules: args.deletableRules,
        ),
      );
    },
  };
}

/// generated route for
/// [ServerListPage]
class ServerListRoute extends PageRouteInfo<void> {
  const ServerListRoute({List<PageRouteInfo>? children})
      : super(
          ServerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServerListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [WhitelistPage]
class WhitelistRoute extends PageRouteInfo<WhitelistRouteArgs> {
  WhitelistRoute({
    Key? key,
    required Server server,
    WhitelistPort? ports,
    bool skipInput = false,
    List<PageRouteInfo>? children,
  }) : super(
          WhitelistRoute.name,
          args: WhitelistRouteArgs(
            key: key,
            server: server,
            ports: ports,
            skipInput: skipInput,
          ),
          initialChildren: children,
        );

  static const String name = 'WhitelistRoute';

  static const PageInfo<WhitelistRouteArgs> page =
      PageInfo<WhitelistRouteArgs>(name);
}

class WhitelistRouteArgs {
  const WhitelistRouteArgs({
    this.key,
    required this.server,
    this.ports,
    this.skipInput = false,
  });

  final Key? key;

  final Server server;

  final WhitelistPort? ports;

  final bool skipInput;

  @override
  String toString() {
    return 'WhitelistRouteArgs{key: $key, server: $server, ports: $ports, skipInput: $skipInput}';
  }
}

/// generated route for
/// [WhitelistStatusPage]
class WhitelistStatusRoute extends PageRouteInfo<WhitelistStatusRouteArgs> {
  WhitelistStatusRoute({
    Key? key,
    required int serverId,
    required List<FirewallRule> inProgressRules,
    required List<FirewallRule> deletableRules,
    List<PageRouteInfo>? children,
  }) : super(
          WhitelistStatusRoute.name,
          args: WhitelistStatusRouteArgs(
            key: key,
            serverId: serverId,
            inProgressRules: inProgressRules,
            deletableRules: deletableRules,
          ),
          initialChildren: children,
        );

  static const String name = 'WhitelistStatusRoute';

  static const PageInfo<WhitelistStatusRouteArgs> page =
      PageInfo<WhitelistStatusRouteArgs>(name);
}

class WhitelistStatusRouteArgs {
  const WhitelistStatusRouteArgs({
    this.key,
    required this.serverId,
    required this.inProgressRules,
    required this.deletableRules,
  });

  final Key? key;

  final int serverId;

  final List<FirewallRule> inProgressRules;

  final List<FirewallRule> deletableRules;

  @override
  String toString() {
    return 'WhitelistStatusRouteArgs{key: $key, serverId: $serverId, inProgressRules: $inProgressRules, deletableRules: $deletableRules}';
  }
}
