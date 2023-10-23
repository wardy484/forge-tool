// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Server _$ServerFromJson(Map<String, dynamic> json) {
  return _Server.fromJson(json);
}

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
      _$ServerCopyWithImpl<$Res, Server>;
  @useResult
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
class _$ServerCopyWithImpl<$Res, $Val extends Server>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? credentialId = null,
    Object? name = null,
    Object? region = null,
    Object? phpVersion = null,
    Object? databaseType = null,
    Object? ipAddress = null,
    Object? privateIpAddress = null,
    Object? blackfireStatus = freezed,
    Object? papertrailStatus = freezed,
    Object? revoked = null,
    Object? createdAt = null,
    Object? isReady = null,
    Object? network = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      credentialId: null == credentialId
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      phpVersion: null == phpVersion
          ? _value.phpVersion
          : phpVersion // ignore: cast_nullable_to_non_nullable
              as String,
      databaseType: null == databaseType
          ? _value.databaseType
          : databaseType // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      privateIpAddress: null == privateIpAddress
          ? _value.privateIpAddress
          : privateIpAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blackfireStatus: freezed == blackfireStatus
          ? _value.blackfireStatus
          : blackfireStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      papertrailStatus: freezed == papertrailStatus
          ? _value.papertrailStatus
          : papertrailStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      revoked: null == revoked
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerImplCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$$ServerImplCopyWith(
          _$ServerImpl value, $Res Function(_$ServerImpl) then) =
      __$$ServerImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$ServerImplCopyWithImpl<$Res>
    extends _$ServerCopyWithImpl<$Res, _$ServerImpl>
    implements _$$ServerImplCopyWith<$Res> {
  __$$ServerImplCopyWithImpl(
      _$ServerImpl _value, $Res Function(_$ServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? credentialId = null,
    Object? name = null,
    Object? region = null,
    Object? phpVersion = null,
    Object? databaseType = null,
    Object? ipAddress = null,
    Object? privateIpAddress = null,
    Object? blackfireStatus = freezed,
    Object? papertrailStatus = freezed,
    Object? revoked = null,
    Object? createdAt = null,
    Object? isReady = null,
    Object? network = null,
  }) {
    return _then(_$ServerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      credentialId: null == credentialId
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      phpVersion: null == phpVersion
          ? _value.phpVersion
          : phpVersion // ignore: cast_nullable_to_non_nullable
              as String,
      databaseType: null == databaseType
          ? _value.databaseType
          : databaseType // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      privateIpAddress: null == privateIpAddress
          ? _value.privateIpAddress
          : privateIpAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blackfireStatus: freezed == blackfireStatus
          ? _value.blackfireStatus
          : blackfireStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      papertrailStatus: freezed == papertrailStatus
          ? _value.papertrailStatus
          : papertrailStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      revoked: null == revoked
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _value._network
          : network // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerImpl implements _Server {
  _$ServerImpl(
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
      required final List<int> network})
      : _network = network;

  factory _$ServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerImplFromJson(json);

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
  final List<int> _network;
  @override
  List<int> get network {
    if (_network is EqualUnmodifiableListView) return _network;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_network);
  }

  @override
  String toString() {
    return 'Server(id: $id, credentialId: $credentialId, name: $name, region: $region, phpVersion: $phpVersion, databaseType: $databaseType, ipAddress: $ipAddress, privateIpAddress: $privateIpAddress, blackfireStatus: $blackfireStatus, papertrailStatus: $papertrailStatus, revoked: $revoked, createdAt: $createdAt, isReady: $isReady, network: $network)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.credentialId, credentialId) ||
                other.credentialId == credentialId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.phpVersion, phpVersion) ||
                other.phpVersion == phpVersion) &&
            (identical(other.databaseType, databaseType) ||
                other.databaseType == databaseType) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.privateIpAddress, privateIpAddress) ||
                other.privateIpAddress == privateIpAddress) &&
            (identical(other.blackfireStatus, blackfireStatus) ||
                other.blackfireStatus == blackfireStatus) &&
            (identical(other.papertrailStatus, papertrailStatus) ||
                other.papertrailStatus == papertrailStatus) &&
            (identical(other.revoked, revoked) || other.revoked == revoked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            const DeepCollectionEquality().equals(other._network, _network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      credentialId,
      name,
      region,
      phpVersion,
      databaseType,
      ipAddress,
      privateIpAddress,
      blackfireStatus,
      papertrailStatus,
      revoked,
      createdAt,
      isReady,
      const DeepCollectionEquality().hash(_network));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      __$$ServerImplCopyWithImpl<_$ServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerImplToJson(
      this,
    );
  }
}

abstract class _Server implements Server {
  factory _Server(
      {required final int id,
      required final int credentialId,
      required final String name,
      required final String region,
      required final String phpVersion,
      required final String databaseType,
      required final String ipAddress,
      required final String privateIpAddress,
      final String? blackfireStatus,
      final String? papertrailStatus,
      required final bool revoked,
      required final String createdAt,
      required final bool isReady,
      required final List<int> network}) = _$ServerImpl;

  factory _Server.fromJson(Map<String, dynamic> json) = _$ServerImpl.fromJson;

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
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
