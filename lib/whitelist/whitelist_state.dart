import 'package:forge/forge/model/firewall/firewall_rule/firewall_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'whitelist_state.freezed.dart';

@freezed
class WhitelistState with _$WhitelistState {
  const factory WhitelistState.initial(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
  ) = _Initial;

  const factory WhitelistState.loading(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
  ) = _Loading;

  const factory WhitelistState.queued(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
  ) = _Queued;

  const factory WhitelistState.success(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
  ) = _Success;

  const factory WhitelistState.sucessEmptyQueues(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
  ) = _SuccessEmptyQueues;

  const factory WhitelistState.error(
    List<FirewallRule> rules,
    List<FirewallRule> oldRules,
    String message,
  ) = _Error;
}
