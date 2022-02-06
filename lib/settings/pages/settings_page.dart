import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/mac/widgets/loading.dart';
import 'package:forge/router.dart';
import 'package:forge/settings/cubit/settings_cubit.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/widgets/settings_input.dart';
import 'package:forge/settings/widgets/settings_page_button.dart';
import 'package:macos_ui/macos_ui.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<SettingsCubit>(context).state.maybeWhen(
          loaded: (settings) {
            if (widget.initialPage &&
                settings.name != "" &&
                settings.apiKey != "") {
              ref.read(forgeApiKeyProvider.notifier).state = settings.apiKey;
              AutoRouter.of(context).popUntilRoot();
              AutoRouter.of(context).replace(const ServerListRoute());
            }

            _nameController.text = settings.name;
            _apiKeyController.text = settings.apiKey;
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      titleBar: const TitleBar(
        title: Text('Settings'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return state.when(
                    loading: () => const Loading(),
                    error: (_) => const Loading(),
                    loaded: (Settings settings) {
                      return Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SettingsInput(
                                icon: CupertinoIcons.person,
                                placeholder: 'Enter your name',
                                controller: _nameController,
                              ),
                              const SizedBox(height: 14),
                              SettingsInput(
                                icon: CupertinoIcons.lock,
                                placeholder: 'Enter your api key',
                                controller: _apiKeyController,
                              ),
                              const SizedBox(height: 14),
                              SettingsPageButton(
                                label: "Save",
                                onPressed: () {
                                  String newKey = _apiKeyController.text;
                                  BlocProvider.of<SettingsCubit>(context)
                                      .updateSettings(
                                    _nameController.text,
                                    newKey,
                                  );

                                  ref.read(forgeApiKeyProvider.notifier).state =
                                      newKey;

                                  AutoRouter.of(context).popUntilRoot();
                                  AutoRouter.of(context)
                                      .replace(const ServerListRoute());
                                },
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
          },
        ),
      ],
    );
  }
}
