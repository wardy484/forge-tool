// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_license.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyLicenseHash() => r'6c5f296916f07b03fb95ecb2607447a2ddadf0ed';

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

/// See also [verifyLicense].
@ProviderFor(verifyLicense)
const verifyLicenseProvider = VerifyLicenseFamily();

/// See also [verifyLicense].
class VerifyLicenseFamily extends Family<AsyncValue<bool>> {
  /// See also [verifyLicense].
  const VerifyLicenseFamily();

  /// See also [verifyLicense].
  VerifyLicenseProvider call(
    String licenseKey,
    String email,
  ) {
    return VerifyLicenseProvider(
      licenseKey,
      email,
    );
  }

  @override
  VerifyLicenseProvider getProviderOverride(
    covariant VerifyLicenseProvider provider,
  ) {
    return call(
      provider.licenseKey,
      provider.email,
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
  String? get name => r'verifyLicenseProvider';
}

/// See also [verifyLicense].
class VerifyLicenseProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [verifyLicense].
  VerifyLicenseProvider(
    String licenseKey,
    String email,
  ) : this._internal(
          (ref) => verifyLicense(
            ref as VerifyLicenseRef,
            licenseKey,
            email,
          ),
          from: verifyLicenseProvider,
          name: r'verifyLicenseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyLicenseHash,
          dependencies: VerifyLicenseFamily._dependencies,
          allTransitiveDependencies:
              VerifyLicenseFamily._allTransitiveDependencies,
          licenseKey: licenseKey,
          email: email,
        );

  VerifyLicenseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.licenseKey,
    required this.email,
  }) : super.internal();

  final String licenseKey;
  final String email;

  @override
  Override overrideWith(
    FutureOr<bool> Function(VerifyLicenseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyLicenseProvider._internal(
        (ref) => create(ref as VerifyLicenseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        licenseKey: licenseKey,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _VerifyLicenseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyLicenseProvider &&
        other.licenseKey == licenseKey &&
        other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, licenseKey.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyLicenseRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `licenseKey` of this provider.
  String get licenseKey;

  /// The parameter `email` of this provider.
  String get email;
}

class _VerifyLicenseProviderElement
    extends AutoDisposeFutureProviderElement<bool> with VerifyLicenseRef {
  _VerifyLicenseProviderElement(super.provider);

  @override
  String get licenseKey => (origin as VerifyLicenseProvider).licenseKey;
  @override
  String get email => (origin as VerifyLicenseProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
