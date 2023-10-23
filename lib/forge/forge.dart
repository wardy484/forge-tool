import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule/create_firewall_rule.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule_response/create_firewall_rule_response.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/forge/model/firewall/get_firewall_rule_response/get_firewall_rule_response.dart';
import 'package:forge/forge/model/firewall/list_firewall_rules_response/list_firewall_rules_response.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/settings/settings_notifier.dart';

const String forgeUrl = "https://forge.laravel.com/api/v1";

final forgeClientProvider = Provider((ref) {
  final String apiKey = ref.watch(settingsNotifierProvider).maybeWhen(
        valid: (settings) => settings.apiKey,
        loaded: (settings) => settings.apiKey,
        orElse: () => "",
      );

  final options = BaseOptions(
    baseUrl: forgeUrl,
    headers: {
      "Authorization": "Bearer $apiKey",
      Headers.contentTypeHeader: "application/json",
      Headers.acceptHeader: "application/json",
    },
  );

  return Dio(options);
});

final forgeSdkProvider = Provider((ref) {
  final client = ref.watch(forgeClientProvider);

  return ForgeSdk(
    client: client,
  );
});

class ForgeSdk {
  final Dio client;

  ForgeSdk({required this.client});

  Future<ServerList> listServers() async {
    final res = await client.get("/servers");

    if (res.statusCode == 200) {
      final allServers = ServerList.fromJson(res.data);

      // Exclude revoked servers, these are probably deleted.
      return ServerList(
        servers: allServers.servers.where((server) {
          return server.revoked == false;
        }).toList(),
      );
    }

    return ServerList(servers: []);
  }

  Future<FirewallRule> createFirewallRule(
    int serverId,
    CreateFirewallRule rule,
  ) async {
    final res = await client.post(
      "/servers/$serverId/firewall-rules",
      data: rule.toJson(),
    );

    if (res.statusCode == 200) {
      return CreateFirewallRuleResponse.fromJson(res.data).rule;
    }

    throw Error();
  }

  Future<List<FirewallRule>> listRules(
    int serverId,
  ) async {
    final res = await client.get("/servers/$serverId/firewall-rules");

    if (res.statusCode == 200) {
      return ListFirewallRulesResponse.fromJson(res.data).rules;
    }

    throw Error();
  }

  Future<FirewallRule> getRule(
    int serverId,
    int ruleId,
  ) async {
    final res = await client.get("/servers/$serverId/firewall-rules/$ruleId");

    if (res.statusCode == 200) {
      return GetFirewallRuleResponse.fromJson(res.data).rule;
    }

    throw Error();
  }

  Future<bool> deleteRule(
    int serverId,
    int ruleId,
  ) async {
    final res = await client.delete(
      "/servers/$serverId/firewall-rules/$ruleId",
    );

    return res.statusCode == 200;
  }
}

Future<bool> verifyApiKey(ForgeSdk forge) async {
  try {
    await forge.listServers();
    return true;
  } catch (e) {
    if (e is DioError) {
      if (e.response?.statusCode == 422) {
        return false;
      }
    }
  }

  return false;
}
