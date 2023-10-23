import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/mac/widgets/buttons/danger_button.dart';
import 'package:forge/mac/widgets/custom_list_tile.dart';
import 'package:forge/mac/widgets/loading.dart';
import 'package:forge/whitelist/whitelist_state.dart';
import 'package:forge/whitelist/whitelist_state_notifier.dart';
import 'package:macos_ui/macos_ui.dart';

@RoutePage()
class WhitelistStatusPage extends ConsumerStatefulWidget {
  final List<FirewallRule> inProgressRules;
  final List<FirewallRule> deletableRules;
  final int serverId;

  const WhitelistStatusPage({
    super.key,
    required this.serverId,
    required this.inProgressRules,
    required this.deletableRules,
  });

  @override
  _WhitelistStatusPageState createState() => _WhitelistStatusPageState();
}

class _WhitelistStatusPageState extends ConsumerState<WhitelistStatusPage> {
  @override
  void didChangeDependencies() {
    _checkProgress();

    super.didChangeDependencies();
  }

  void _checkProgress() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      var whitelistNotifier = ref.read(whitelistNotifierProvider.notifier);
      var whitelistState = ref.read(whitelistNotifierProvider);

      whitelistNotifier.checkProgress(
        widget.serverId,
        whitelistState.rules,
        whitelistState.oldRules,
      );

      bool containsInProgressRules = whitelistState.rules.where((rule) {
        return rule.status == "installing" || rule.status == "removing";
      }).isNotEmpty;

      if (containsInProgressRules) {
        _checkProgress();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(whitelistNotifierProvider, (prev, WhitelistState next) {
      next.whenOrNull(
        sucessEmptyQueues: (_, __) {
          AutoRouter.of(context).popUntilRoot();
        },
        success: (_, __) {
          // TODO: Make this configurable
          ref
              .read(
                whitelistNotifierProvider.notifier,
              )
              .deleteOldRules(
                widget.serverId,
                widget.deletableRules,
              );

          _checkProgress();
        },
      );
    });

    return MacosScaffold(
      toolBar: const ToolBar(
        centerTitle: true,
        title: Text('Updating firewall rules...'),
        titleWidth: 200,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            var currentState = ref.read(whitelistNotifierProvider);
            return ref.watch(whitelistNotifierProvider).maybeWhen(
                  loading: (_, old) => const Loading(),
                  orElse: () {
                    return Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              controller: scrollController,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 0.2,
                                  color: Colors.grey,
                                );
                              },
                              itemCount: currentState.rules.length,
                              itemBuilder: (context, index) {
                                var rule = currentState.rules[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomListTile(
                                        leading: const Icon(
                                            CupertinoIcons.add_circled),
                                        title: rule.name,
                                        subtitle:
                                            "IP Address: ${rule.ipAddress} | Port: ${rule.port}",
                                      ),
                                      if (rule.status == "installing" ||
                                          rule.status == "removing")
                                        const ProgressCircle(
                                          value: null,
                                        )
                                      else
                                        const Icon(
                                          CupertinoIcons.check_mark,
                                          color: Colors.green,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 15,
                              right: 5,
                            ),
                            child: ref
                                .watch(whitelistNotifierProvider)
                                .maybeWhen(
                                  success: (newRules, oldRules) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Now be good and clean up!"),
                                        DangerButton(
                                          label: "Delete old rules",
                                          onPressed: () {
                                            ref
                                                .read(
                                                  whitelistNotifierProvider
                                                      .notifier,
                                                )
                                                .deleteOldRules(
                                                  widget.serverId,
                                                  widget.deletableRules,
                                                );

                                            _checkProgress();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                  orElse: () => const Text(
                                      "Please wait forge can be slow..."),
                                ),
                          )
                        ],
                      ),
                    );
                  },
                );
          },
        ),
      ],
    );
  }
}
