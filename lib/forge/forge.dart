import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/common/exceptions/rate_limit_exception.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule/create_firewall_rule.dart';
import 'package:forge/forge/model/firewall/create_firewall_rule_response/create_firewall_rule_response.dart';
import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:forge/forge/model/firewall/get_firewall_rule_response/get_firewall_rule_response.dart';
import 'package:forge/forge/model/firewall/list_firewall_rules_response/list_firewall_rules_response.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/settings/settings_notifier.dart';

const String forgeUrl = "https://forge.laravel.com/api/v1";

final forgeClientProvider = Provider((ref) {
  final String apiKey = ref.watch(fetchSettingsProvider).maybeWhen(
        data: (settings) => settings.apiKey,
        orElse: () => "",
      );

  return buildForgeDio(apiKey);
});

Dio buildForgeDio(String apiKey) {
  final options = BaseOptions(
    baseUrl: forgeUrl,
    headers: {
      "Authorization": "Bearer $apiKey",
      Headers.contentTypeHeader: "application/json",
      Headers.acceptHeader: "application/json",
    },
  );

  return Dio(options);
}

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

    if (res.statusCode == 429) {
      throw RateLimitException();
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

    if (res.statusCode == 429) {
      throw RateLimitException();
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

    if (res.statusCode == 429) {
      throw RateLimitException();
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

    if (res.statusCode == 429) {
      throw RateLimitException();
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

    if (res.statusCode == 429) {
      throw RateLimitException();
    }

    return res.statusCode == 200;
  }

  Future<bool> verifyApiKey(String apiKey) async {
    try {
      await client.get(
        "/servers",
        options: Options(
          headers: {
            "Authorization": "Bearer $apiKey",
          },
        ),
      );

      return true;
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          return false;
        }

        if (e.response?.statusCode == 429) {
          throw RateLimitException();
        }
      }
    }

    return false;
  }
}
