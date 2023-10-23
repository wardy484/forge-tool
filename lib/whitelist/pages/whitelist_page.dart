import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:forge/exceptions/rule_exists_exception.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/mac/widgets/loading.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/widgets/port_select_option.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/settings_input.dart';
import 'package:forge/settings/widgets/settings_page_button.dart';
import 'package:forge/whitelist/whitelist_state_notifier.dart';
import 'package:macos_ui/macos_ui.dart';

enum WhitelistPort implements Comparable<WhitelistPort> {
  http(ports: ["80", "443"]),
  mysql(ports: ["3306"]),
  ssh(ports: ["22"]);

  const WhitelistPort({
    required this.ports,
  });

  final List<String> ports;

  String get label {
    switch (this) {
      case WhitelistPort.http:
        return "HTTP";
      case WhitelistPort.mysql:
        return "MySQL";
      case WhitelistPort.ssh:
        return "SSH";
    }
  }

  @override
  int compareTo(WhitelistPort other) => index.compareTo(other.index);
}

@RoutePage()
class WhitelistPage extends ConsumerStatefulWidget {
  final Server server;
  final WhitelistPort? ports;
  final bool skipInput;

  const WhitelistPage({
    super.key,
    required this.server,
    this.ports,
    this.skipInput = false,
  });

  @override
  _WhitelistPageState createState() => _WhitelistPageState();
}

class _WhitelistPageState extends ConsumerState<WhitelistPage> {
  final _formKey = GlobalKey<FormState>();
  final _ipAddressController = TextEditingController();
  final _nameController = TextEditingController();

  final List<WhitelistPort> selectedPorts = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (widget.skipInput && widget.ports != null) {
        selectedPorts.add(widget.ports!);

        whitelist(selectedPorts);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: Text('Select ports for ${widget.server.name}'),
        titleWidth: 400,
        centerTitle: true,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return StatefulBuilder(builder: (context, setState) {
              return ref.watch(whitelistNotifierProvider).maybeWhen(
                    loading: (_, old) => const Loading(),
                    orElse: () {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SettingsInput(
                                icon: CupertinoIcons.person,
                                placeholder: "Name, leave blank for your own.",
                                controller: _nameController,
                              ),
                              const SizedBox(height: 8),
                              SettingsInput(
                                icon: CupertinoIcons
                                    .antenna_radiowaves_left_right,
                                placeholder:
                                    "IP Address, leave blank to use your own.",
                                controller: _ipAddressController,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: WhitelistPort.values.map((ports) {
                                  return PortSelectOption(
                                    port: ports,
                                    isChecked: selectedPorts.contains(ports),
                                    onChanged: (port, checked) {
                                      setState(() {
                                        if (selectedPorts.contains(port)) {
                                          selectedPorts.removeWhere(
                                              (value) => value == port);
                                        } else {
                                          selectedPorts.add(port);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 12),
                              SettingsPageButton(
                                label: "Whitelist",
                                onPressed: () => whitelist(selectedPorts),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
            });
          },
        ),
      ],
    );
  }

  Future<void> whitelist(List<WhitelistPort> ports) async {
    ref.read(settingsNotifierProvider).whenOrNull(
      valid: (settings) async {
        final whitelistNotifier = ref.read(whitelistNotifierProvider.notifier);

        try {
          final ipAddress = _ipAddressController.text == ""
              ? null
              : _ipAddressController.text;

          final name =
              _nameController.text == "" ? settings.name : _nameController.text;

          await whitelistNotifier.createFirewallRules(
            serverId: widget.server.id,
            name: name,
            ports: ports.map((e) => e.ports).expand((i) => i).toList(),
            ipAddress: ipAddress,
          );
        } catch (e) {
          if (e is FirewallRuleExistsException) {
            showToast(
              "You're already whitelisted on all requested ports.",
              context: context,
              duration: const Duration(seconds: 10),
              backgroundColor: Colors.red,
            );
            whitelistNotifier.reset();
          }
        }

        ref.read(whitelistNotifierProvider).maybeWhen(
          queued: (queued, deletable) {
            AutoRouter.of(context).push(
              WhitelistStatusRoute(
                serverId: widget.server.id,
                inProgressRules: queued,
                deletableRules: deletable,
              ),
            );
          },
          orElse: () {
            // TODO: Handle more errors
          },
        );
      },
    );
  }
}
