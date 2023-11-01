import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/exceptions/rule_exists_exception.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule/create_firewall_rule.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/firewall_rules/firewall_rule_name.dart';

final firewallRuleRepositoryProvider = Provider<FirewallRuleRepository>((ref) {
  return FirewallRuleRepository(
    forge: ref.watch(forgeSdkProvider),
  );
});

class FirewallRuleRepository {
  final ForgeSdk forge;

  FirewallRuleRepository({
    required this.forge,
  });

  Future<List<FirewallRule>> listRules(int serverId) async {
    return forge.listRules(serverId);
  }

  List<String> _filterExistingRules(
    List<FirewallRule> rules,
    int serverId,
    String ipAddress,
    List<String> ports,
  ) {
    return ports
        .where((port) => !rules
            .any((rule) => rule.ipAddress == ipAddress && rule.port == port))
        .toList();
  }

  List<FirewallRule> _checkForSimilarRules(
    List<FirewallRule> rules,
    FirewallRuleName name,
    String port,
  ) {
    return rules
        .where((rule) =>
            rule.name.startsWith(name.matcher) &&
            !rule.name.endsWith(name.suffix) &&
            rule.port == port)
        .toList();
  }

  Future<void> createFirewallRules({
    required int serverId,
    required String name,
    required List<String> ports,
    String? ipAddress,
  }) async {
    try {
      FirewallRuleName ruleName = FirewallRuleName(name: name);
      ipAddress ??= await Ipify.ipv4();
      final rules = await forge.listRules(serverId);

      List<Future<FirewallRule>> ruleQueue = [];
      List<FirewallRule> toDelete = [];

      ports = _filterExistingRules(rules, serverId, ipAddress, ports);

      if (ports.isEmpty) {
        throw FirewallRuleExistsException();
      }

      for (var port in ports) {
        toDelete.addAll(_checkForSimilarRules(rules, ruleName, port));

        var future = forge.createFirewallRule(
          serverId,
          CreateFirewallRule(
            name: ruleName.toString(),
            port: int.parse(port),
            type: "allow",
            ipAddress: ipAddress,
          ),
        );

        ruleQueue.add(future);

        // Sleep between writes in order to not destroy the ip tables
        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkForInProgressRules(int serverId) async {
    List<FirewallRule> rules = await forge.listRules(serverId);

    return rules.any((rule) {
      return rule.status == "installing" || rule.status == "removing";
    });
  }
}
