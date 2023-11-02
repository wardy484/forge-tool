// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewall_rule_repsitory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkAllRulesInstalledHash() =>
    r'61c871c70feffe02dc166e1ad1865a4c41c9646c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [checkAllRulesInstalled].
@ProviderFor(checkAllRulesInstalled)
const checkAllRulesInstalledProvider = CheckAllRulesInstalledFamily();

/// See also [checkAllRulesInstalled].
class CheckAllRulesInstalledFamily extends Family<AsyncValue<bool>> {
  /// See also [checkAllRulesInstalled].
  const CheckAllRulesInstalledFamily();

  /// See also [checkAllRulesInstalled].
  CheckAllRulesInstalledProvider call(
    int serverId,
  ) {
    return CheckAllRulesInstalledProvider(
      serverId,
    );
  }

  @override
  CheckAllRulesInstalledProvider getProviderOverride(
    covariant CheckAllRulesInstalledProvider provider,
  ) {
    return call(
      provider.serverId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkAllRulesInstalledProvider';
}

/// See also [checkAllRulesInstalled].
class CheckAllRulesInstalledProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [checkAllRulesInstalled].
  CheckAllRulesInstalledProvider(
    int serverId,
  ) : this._internal(
          (ref) => checkAllRulesInstalled(
            ref as CheckAllRulesInstalledRef,
            serverId,
          ),
          from: checkAllRulesInstalledProvider,
          name: r'checkAllRulesInstalledProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkAllRulesInstalledHash,
          dependencies: CheckAllRulesInstalledFamily._dependencies,
          allTransitiveDependencies:
              CheckAllRulesInstalledFamily._allTransitiveDependencies,
          serverId: serverId,
        );

  CheckAllRulesInstalledProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serverId,
  }) : super.internal();

  final int serverId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CheckAllRulesInstalledRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckAllRulesInstalledProvider._internal(
        (ref) => create(ref as CheckAllRulesInstalledRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serverId: serverId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CheckAllRulesInstalledProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckAllRulesInstalledProvider &&
        other.serverId == serverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckAllRulesInstalledRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `serverId` of this provider.
  int get serverId;
}

class _CheckAllRulesInstalledProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with CheckAllRulesInstalledRef {
  _CheckAllRulesInstalledProviderElement(super.provider);

  @override
  int get serverId => (origin as CheckAllRulesInstalledProvider).serverId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
