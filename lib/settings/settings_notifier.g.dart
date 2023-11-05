// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSettingsHash() => r'f76ab1af5916745bcf220b763edf5afae54420a1';

/// See also [fetchSettings].
@ProviderFor(fetchSettings)
final fetchSettingsProvider = FutureProvider<SettingsModel>.internal(
  fetchSettings,
  name: r'fetchSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchSettingsRef = FutureProviderRef<SettingsModel>;
String _$settingsHash() => r'7c59c89e3cdfe4678d05bfc9b1750f4297cbf9b2';

/// See also [Settings].
@ProviderFor(Settings)
final settingsProvider =
    AsyncNotifierProvider<Settings, SettingsModel>.internal(
  Settings.new,
  name: r'settingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Settings = AsyncNotifier<SettingsModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
