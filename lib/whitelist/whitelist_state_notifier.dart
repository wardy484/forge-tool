import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/exceptions/rule_exists_exception.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule/create_firewall_rule.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/whitelist/rule_name.dart';
import 'package:forge/whitelist/whitelist_state.dart';

final whitelistNotifierProvider =
    StateNotifierProvider<WhitelistNotifier, WhitelistState>((ref) {
  return WhitelistNotifier(
    forge: ref.watch(forgeSdkProvider),
  );
});

class WhitelistNotifier extends StateNotifier<WhitelistState> {
  final ForgeSdk forge;

  WhitelistNotifier({
    required this.forge,
  }) : super(const WhitelistState.initial([], []));

  void reset() {
    state = const WhitelistState.initial([], []);
  }

  List<String> _filterExistingRules(
    List<FirewallRule> rules,
    int serverId,
    String ipAddress,
    List<String> ports,
  ) {
    rules = rules.where((rule) => rule.ipAddress == ipAddress).toList();

    return ports
        .where((port) => rules.where((rule) => rule.port == port).isEmpty)
        .toList();
  }

  List<FirewallRule> _isSimilar(
    List<FirewallRule> rules,
    RuleName name,
    String port,
  ) {
    return rules.where((rule) {
      return rule.name.startsWith(name.matcher) &&
          !rule.name.endsWith(name.suffix) &&
          rule.port == port;
    }).toList();
  }

  Future<void> createFirewallRules({
    required int serverId,
    required String name,
    required List<String> ports,
    String? ipAddress,
  }) async {
    try {
      state = WhitelistState.loading(state.rules, state.oldRules);

      RuleName ruleName = RuleName(name: name);
      ipAddress ??= await Ipify.ipv4();
      final rules = await forge.listRules(serverId);

      List<Future<FirewallRule>> ruleQueue = [];
      List<FirewallRule> toDelete = [];

      ports = _filterExistingRules(rules, serverId, ipAddress, ports);

      if (ports.isEmpty) {
        throw FirewallRuleExistsException();
      }

      for (var port in ports) {
        toDelete.addAll(_isSimilar(rules, ruleName, port));

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

      final createdRules = await Future.wait(ruleQueue);

      state = WhitelistState.queued(createdRules, toDelete);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> checkProgress(
    int serverId,
    List<FirewallRule> inProgressRules,
    List<FirewallRule> deletableRules,
  ) async {
    List<FirewallRule> allRules = await forge.listRules(serverId);

    List<FirewallRule> filteredRules = allRules.where((rule) {
      return inProgressRules
          .where((inProgressRule) => inProgressRule.id == rule.id)
          .isNotEmpty;
    }).toList();

    if (rulesAreStillInstalling(filteredRules)) {
      state = WhitelistState.queued(filteredRules, deletableRules);
    } else {
      var inProgressRules = filteredRules.where((rule) {
        return rule.status == "installing" || rule.status == "removing";
      });
      if (inProgressRules.isEmpty && deletableRules.isEmpty) {
        state = const WhitelistState.sucessEmptyQueues([], []);
      } else {
        state = WhitelistState.success(filteredRules, deletableRules);
      }
    }
  }

  Future<void> deleteOldRules(serverId, List<FirewallRule> oldRules) async {
    state = WhitelistState.loading(oldRules, []);

    for (var rule in oldRules) {
      await forge.deleteRule(serverId, rule.id);
      await Future.delayed(const Duration(seconds: 1));
    }

    oldRules = oldRules.map((e) => e.copyWith(status: "removing")).toList();

    state = WhitelistState.queued(oldRules, []);
  }

  bool rulesAreStillInstalling(List<FirewallRule> rules) {
    return rules.where((rule) {
      return rule.status == "installing" || rule.status == "removing";
    }).isNotEmpty;
  }
}
