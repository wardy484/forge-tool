// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_action_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchQuickActionsHash() => r'91e05c7af31e52ab370d8a72b14652d39f7ac72a';

/// See also [fetchQuickActions].
@ProviderFor(fetchQuickActions)
final fetchQuickActionsProvider =
    AutoDisposeFutureProvider<List<QuickAction>>.internal(
  fetchQuickActions,
  name: r'fetchQuickActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchQuickActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchQuickActionsRef = AutoDisposeFutureProviderRef<List<QuickAction>>;
String _$quickActionsHash() => r'6b05db0db6ffb4966ce89901bfbe948b318aab86';

/// See also [QuickActions].
@ProviderFor(QuickActions)
final quickActionsProvider =
    AsyncNotifierProvider<QuickActions, List<QuickAction>>.internal(
  QuickActions.new,
  name: r'quickActionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$quickActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QuickActions = AsyncNotifier<List<QuickAction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
