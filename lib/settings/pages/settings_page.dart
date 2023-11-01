import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/mac/widgets/loading.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/settings_form.dart';
import 'package:macos_ui/macos_ui.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  final bool initialPage;

  const SettingsPage({
    Key? key,
    this.initialPage = true,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Settings'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ref.watch(settingsNotifierProvider).maybeWhen(
                    orElse: () => const Loading(),
                    loaded: (Settings settings) {
                      return SettingsForm(settings: settings);
                    },
                    valid: (Settings settings) {
                      return SettingsForm(settings: settings);
                    },
                    error: (Settings settings, error) {
                      return SettingsForm(settings: settings, error: error);
                    },
                  ),
            );
          },
        ),
      ],
    );
  }
}
