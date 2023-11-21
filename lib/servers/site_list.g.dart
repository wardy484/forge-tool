// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$siteListsHash() => r'09a611c22edaa5756f3a5a8bd953219976b6af2b';

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

/// See also [siteLists].
@ProviderFor(siteLists)
const siteListsProvider = SiteListsFamily();

/// See also [siteLists].
class SiteListsFamily extends Family<AsyncValue<SiteList>> {
  /// See also [siteLists].
  const SiteListsFamily();

  /// See also [siteLists].
  SiteListsProvider call(
    int serverId,
  ) {
    return SiteListsProvider(
      serverId,
    );
  }

  @override
  SiteListsProvider getProviderOverride(
    covariant SiteListsProvider provider,
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
  String? get name => r'siteListsProvider';
}

/// See also [siteLists].
class SiteListsProvider extends AutoDisposeFutureProvider<SiteList> {
  /// See also [siteLists].
  SiteListsProvider(
    int serverId,
  ) : this._internal(
          (ref) => siteLists(
            ref as SiteListsRef,
            serverId,
          ),
          from: siteListsProvider,
          name: r'siteListsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$siteListsHash,
          dependencies: SiteListsFamily._dependencies,
          allTransitiveDependencies: SiteListsFamily._allTransitiveDependencies,
          serverId: serverId,
        );

  SiteListsProvider._internal(
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
    FutureOr<SiteList> Function(SiteListsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SiteListsProvider._internal(
        (ref) => create(ref as SiteListsRef),
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
  AutoDisposeFutureProviderElement<SiteList> createElement() {
    return _SiteListsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SiteListsProvider && other.serverId == serverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SiteListsRef on AutoDisposeFutureProviderRef<SiteList> {
  /// The parameter `serverId` of this provider.
  int get serverId;
}

class _SiteListsProviderElement
    extends AutoDisposeFutureProviderElement<SiteList> with SiteListsRef {
  _SiteListsProviderElement(super.provider);

  @override
  int get serverId => (origin as SiteListsProvider).serverId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
