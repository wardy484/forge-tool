import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru/yaru.dart';

class MainRouter extends HookConsumerWidget {
  const MainRouter({
    super.key,
    required this.yaru,
    required this.hasValidLicense,
  });

  final YaruThemeData yaru;
  final bool hasValidLicense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      theme: yaru.theme,
      darkTheme: yaru.darkTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(deepLinkBuilder: (deepLink) {
        if (hasValidLicense == false) {
          return DeepLink.single(VerifyLicenseRoute());
        }

        return DeepLink.defaultPath;
      }),
    );
  }
}
