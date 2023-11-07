// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSettingsHash() => r'b5c4a9e3589022f10aa2d8be511f043ac127ef04';

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
String _$settingsHash() => r'2640bc1ed0c40eb28d94239fe8efe3466235cfb6';

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
