import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/common/widgets/close_shortcut.dart';
import 'package:forge/common/widgets/main_router.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:yaru/yaru.dart';

class ForgeBuddyApp extends ConsumerStatefulWidget {
  const ForgeBuddyApp({super.key});

  @override
  _ForgeBuddyAppState createState() => _ForgeBuddyAppState();
}

class _ForgeBuddyAppState extends ConsumerState<ForgeBuddyApp> {
  @override
  Widget build(BuildContext context) {
    return CloseShortcut(
      child: YaruTheme(
        builder: (context, yaru, child) {
          return ref.watch(settingsProvider).when(
                data: (settings) {
                  return MainRouter(
                    yaru: yaru,
                    hasValidLicense: settings.hasValidLicense,
                  );
                },
                loading: () => MaterialApp(
                  theme: yaru.theme,
                  darkTheme: yaru.darkTheme,
                  debugShowCheckedModeBanner: false,
                  home: const Scaffold(
                    body: Column(
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ),
                error: (error, stackTrace) {
                  return MaterialApp(
                    theme: yaru.theme,
                    darkTheme: yaru.darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Column(
                        children: [
                          Center(
                            child: Text("Error: ${error}"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
