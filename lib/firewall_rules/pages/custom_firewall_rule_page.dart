import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/firewall_rules/ip_address.dart';
import 'package:forge/firewall_rules/widgets/custom_firewall_rule_form.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:macos_ui/macos_ui.dart';

@RoutePage()
class CustomFirewallRulePage extends ConsumerWidget {
  const CustomFirewallRulePage({super.key, required this.server});

  final Server server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: Text("Add a custom firewall rule to ${server.name}"),
        titleWidth: 500,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: ref.watch(ipAddressProvider).when(
                      data: (ipAddress) {
                        return CustomFirewallRuleForm(
                          server: server,
                          defaultIpAddress: ipAddress ?? "",
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stackTrace) => Center(
                        child: Text(error.toString()),
                      ),
                    ));
          },
        ),
      ],
    );
  }
}
