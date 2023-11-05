import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/common/exceptions/rule_exists_exception.dart';
import 'package:forge/firewall_rules/data/firewall_rule_name.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule/create_firewall_rule.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firewall_rule_repsitory.g.dart';

final firewallRuleRepositoryProvider = Provider<FirewallRuleRepository>((ref) {
  return FirewallRuleRepository(
    forge: ref.watch(forgeSdkProvider),
  );
});

@riverpod
Future<bool> checkAllRulesInstalled(Ref ref, int serverId) async {
  return await Future.delayed(const Duration(seconds: 3)).then((_) async {
    final installing = await ref
        .read(firewallRuleRepositoryProvider)
        .checkForInProgressRules(serverId);

    if (installing) {
      return await checkAllRulesInstalled(ref, serverId);
    }

    return true;
  });
}

class FirewallRuleRepository {
  final ForgeSdk forge;

  FirewallRuleRepository({
    required this.forge,
  });

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

      for (var rule in toDelete) {
        await forge.deleteRule(serverId, rule.id);

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

class ApiTokenAndServerId {
  final String apiToken;
  final int serverId;

  ApiTokenAndServerId({
    required this.apiToken,
    required this.serverId,
  });
}

Future<bool> isolatedProgressCheck(ApiTokenAndServerId args) async {
  final dio = buildForgeDio(args.apiToken);
  final forgeSdk = ForgeSdk(client: dio);
  final firewallRuleRepository = FirewallRuleRepository(forge: forgeSdk);

  return await Future.delayed(const Duration(seconds: 3)).then(
    (_) => performProgressCheck(firewallRuleRepository, args.serverId),
  );
}

Future<bool> performProgressCheck(
    FirewallRuleRepository repository, int serverId) async {
  final installing = await repository.checkForInProgressRules(serverId);

  if (installing) {
    return await performProgressCheck(repository, serverId);
  }

  return true;
}
