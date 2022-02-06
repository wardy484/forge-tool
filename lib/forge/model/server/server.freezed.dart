// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Server _$ServerFromJson(Map<String, dynamic> json) {
  return _Server.fromJson(json);
}

/// @nodoc
class _$ServerTearOff {
  const _$ServerTearOff();

  _Server call(
      {required int id,
      required int credentialId,
      required String name,
      required String region,
      required String phpVersion,
      required String databaseType,
      required String ipAddress,
      required String privateIpAddress,
      String? blackfireStatus,
      String? papertrailStatus,
      required bool revoked,
      required String createdAt,
      required bool isReady,
      required List<int> network}) {
    return _Server(
      id: id,
      credentialId: credentialId,
      name: name,
      region: region,
      phpVersion: phpVersion,
      databaseType: databaseType,
      ipAddress: ipAddress,
      privateIpAddress: privateIpAddress,
      blackfireStatus: blackfireStatus,
      papertrailStatus: papertrailStatus,
      revoked: revoked,
      createdAt: createdAt,
      isReady: isReady,
      network: network,
    );
  }

  Server fromJson(Map<String, Object?> json) {
    return Server.fromJson(json);
  }
}

/// @nodoc
const $Server = _$ServerTearOff();

/// @nodoc
mixin _$Server {
  int get id => throw _privateConstructorUsedError;
  int get credentialId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get phpVersion => throw _privateConstructorUsedError;
  String get databaseType => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  String get privateIpAddress => throw _privateConstructorUsedError;
  String? get blackfireStatus => throw _privateConstructorUsedError;
  String? get papertrailStatus => throw _privateConstructorUsedError;
  bool get revoked => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  List<int> get network => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerCopyWith<Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) then) =
      _$ServerCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int credentialId,
      String name,
      String region,
      String phpVersion,
      String databaseType,
      String ipAddress,
      String privateIpAddress,
      String? blackfireStatus,
      String? papertrailStatus,
      bool revoked,
      String createdAt,
      bool isReady,
      List<int> network});
}

/// @nodoc
class _$ServerCopyWithImpl<$Res> implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._value, this._then);

  final Server _value;
  // ignore: unused_field
  final $Res Function(Server) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? credentialId = freezed,
    Object? name = freezed,
    Object? region = freezed,
    Object? phpVersion = freezed,
    Object? databaseType = freezed,
    Object? ipAddress = freezed,
    Object? privateIpAddress = freezed,
    Object? blackfireStatus = freezed,
    Object? papertrailStatus = freezed,
    Object? revoked = freezed,
    Object? createdAt = freezed,
    Object? isReady = freezed,
    Object? network = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      credentialId: credentialId == freezed
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      phpVersion: phpVersion == freezed
          ? _value.phpVersion
          : phpVersion // ignore: cast_nullable_to_non_nullable
              as String,
      databaseType: databaseType == freezed
          ? _value.databaseType
          : databaseType // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      privateIpAddress: privateIpAddress == freezed
          ? _value.privateIpAddress
          : privateIpAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blackfireStatus: blackfireStatus == freezed
          ? _value.blackfireStatus
          : blackfireStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      papertrailStatus: papertrailStatus == freezed
          ? _value.papertrailStatus
          : papertrailStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      revoked: revoked == freezed
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int credentialId,
      String name,
      String region,
      String phpVersion,
      String databaseType,
      String ipAddress,
      String privateIpAddress,
      String? blackfireStatus,
      String? papertrailStatus,
      bool revoked,
      String createdAt,
      bool isReady,
      List<int> network});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(_Server _value, $Res Function(_Server) _then)
      : super(_value, (v) => _then(v as _Server));

  @override
  _Server get _value => super._value as _Server;

  @override
  $Res call({
    Object? id = freezed,
    Object? credentialId = freezed,
    Object? name = freezed,
    Object? region = freezed,
    Object? phpVersion = freezed,
    Object? databaseType = freezed,
    Object? ipAddress = freezed,
    Object? privateIpAddress = freezed,
    Object? blackfireStatus = freezed,
    Object? papertrailStatus = freezed,
    Object? revoked = freezed,
    Object? createdAt = freezed,
    Object? isReady = freezed,
    Object? network = freezed,
  }) {
    return _then(_Server(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      credentialId: credentialId == freezed
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      phpVersion: phpVersion == freezed
          ? _value.phpVersion
          : phpVersion // ignore: cast_nullable_to_non_nullable
              as String,
      databaseType: databaseType == freezed
          ? _value.databaseType
          : databaseType // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      privateIpAddress: privateIpAddress == freezed
          ? _value.privateIpAddress
          : privateIpAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blackfireStatus: blackfireStatus == freezed
          ? _value.blackfireStatus
          : blackfireStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      papertrailStatus: papertrailStatus == freezed
          ? _value.papertrailStatus
          : papertrailStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      revoked: revoked == freezed
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Server implements _Server {
  _$_Server(
      {required this.id,
      required this.credentialId,
      required this.name,
      required this.region,
      required this.phpVersion,
      required this.databaseType,
      required this.ipAddress,
      required this.privateIpAddress,
      this.blackfireStatus,
      this.papertrailStatus,
      required this.revoked,
      required this.createdAt,
      required this.isReady,
      required this.network});

  factory _$_Server.fromJson(Map<String, dynamic> json) =>
      _$$_ServerFromJson(json);

  @override
  final int id;
  @override
  final int credentialId;
  @override
  final String name;
  @override
  final String region;
  @override
  final String phpVersion;
  @override
  final String databaseType;
  @override
  final String ipAddress;
  @override
  final String privateIpAddress;
  @override
  final String? blackfireStatus;
  @override
  final String? papertrailStatus;
  @override
  final bool revoked;
  @override
  final String createdAt;
  @override
  final bool isReady;
  @override
  final List<int> network;

  @override
  String toString() {
    return 'Server(id: $id, credentialId: $credentialId, name: $name, region: $region, phpVersion: $phpVersion, databaseType: $databaseType, ipAddress: $ipAddress, privateIpAddress: $privateIpAddress, blackfireStatus: $blackfireStatus, papertrailStatus: $papertrailStatus, revoked: $revoked, createdAt: $createdAt, isReady: $isReady, network: $network)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Server &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.credentialId, credentialId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality()
                .equals(other.phpVersion, phpVersion) &&
            const DeepCollectionEquality()
                .equals(other.databaseType, databaseType) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality()
                .equals(other.privateIpAddress, privateIpAddress) &&
            const DeepCollectionEquality()
                .equals(other.blackfireStatus, blackfireStatus) &&
            const DeepCollectionEquality()
                .equals(other.papertrailStatus, papertrailStatus) &&
            const DeepCollectionEquality().equals(other.revoked, revoked) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isReady, isReady) &&
            const DeepCollectionEquality().equals(other.network, network));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(credentialId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(phpVersion),
      const DeepCollectionEquality().hash(databaseType),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(privateIpAddress),
      const DeepCollectionEquality().hash(blackfireStatus),
      const DeepCollectionEquality().hash(papertrailStatus),
      const DeepCollectionEquality().hash(revoked),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isReady),
      const DeepCollectionEquality().hash(network));

  @JsonKey(ignore: true)
  @override
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerToJson(this);
  }
}

abstract class _Server implements Server {
  factory _Server(
      {required int id,
      required int credentialId,
      required String name,
      required String region,
      required String phpVersion,
      required String databaseType,
      required String ipAddress,
      required String privateIpAddress,
      String? blackfireStatus,
      String? papertrailStatus,
      required bool revoked,
      required String createdAt,
      required bool isReady,
      required List<int> network}) = _$_Server;

  factory _Server.fromJson(Map<String, dynamic> json) = _$_Server.fromJson;

  @override
  int get id;
  @override
  int get credentialId;
  @override
  String get name;
  @override
  String get region;
  @override
  String get phpVersion;
  @override
  String get databaseType;
  @override
  String get ipAddress;
  @override
  String get privateIpAddress;
  @override
  String? get blackfireStatus;
  @override
  String? get papertrailStatus;
  @override
  bool get revoked;
  @override
  String get createdAt;
  @override
  bool get isReady;
  @override
  List<int> get network;
  @override
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}
