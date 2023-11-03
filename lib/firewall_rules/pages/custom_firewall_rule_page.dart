import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/firewall_rules/ip_address.dart';
import 'package:forge/firewall_rules/widgets/custom_firewall_rule_form.dart';
import 'package:forge/forge/model/server/server.dart';

@RoutePage()
class CustomFirewallRulePage extends ConsumerWidget {
  const CustomFirewallRulePage({super.key, required this.server});

  final Server server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a custom firewall rule to ${server.name}"),
      ),
      body: ref.watch(ipAddressAndSettingsProvider).when(
            data: (config) {
              return CustomFirewallRuleForm(
                server: server,
                defaultIpAddress: config.ipAddress ?? "",
                settings: config.settings,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
          ),
    );
  }
}
