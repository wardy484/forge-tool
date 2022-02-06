// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firewall_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirewallRule _$FirewallRuleFromJson(Map<String, dynamic> json) {
  return _FirewallRule.fromJson(json);
}

/// @nodoc
class _$FirewallRuleTearOff {
  const _$FirewallRuleTearOff();

  _FirewallRule call(
      {required int id,
      required String name,
      required String port,
      required String type,
      String? ipAddress,
      required String status,
      required String createdAt}) {
    return _FirewallRule(
      id: id,
      name: name,
      port: port,
      type: type,
      ipAddress: ipAddress,
      status: status,
      createdAt: createdAt,
    );
  }

  FirewallRule fromJson(Map<String, Object?> json) {
    return FirewallRule.fromJson(json);
  }
}

/// @nodoc
const $FirewallRule = _$FirewallRuleTearOff();

/// @nodoc
mixin _$FirewallRule {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get port => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirewallRuleCopyWith<FirewallRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirewallRuleCopyWith<$Res> {
  factory $FirewallRuleCopyWith(
          FirewallRule value, $Res Function(FirewallRule) then) =
      _$FirewallRuleCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String port,
      String type,
      String? ipAddress,
      String status,
      String createdAt});
}

/// @nodoc
class _$FirewallRuleCopyWithImpl<$Res> implements $FirewallRuleCopyWith<$Res> {
  _$FirewallRuleCopyWithImpl(this._value, this._then);

  final FirewallRule _value;
  // ignore: unused_field
  final $Res Function(FirewallRule) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? port = freezed,
    Object? type = freezed,
    Object? ipAddress = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FirewallRuleCopyWith<$Res>
    implements $FirewallRuleCopyWith<$Res> {
  factory _$FirewallRuleCopyWith(
          _FirewallRule value, $Res Function(_FirewallRule) then) =
      __$FirewallRuleCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String port,
      String type,
      String? ipAddress,
      String status,
      String createdAt});
}

/// @nodoc
class __$FirewallRuleCopyWithImpl<$Res> extends _$FirewallRuleCopyWithImpl<$Res>
    implements _$FirewallRuleCopyWith<$Res> {
  __$FirewallRuleCopyWithImpl(
      _FirewallRule _value, $Res Function(_FirewallRule) _then)
      : super(_value, (v) => _then(v as _FirewallRule));

  @override
  _FirewallRule get _value => super._value as _FirewallRule;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? port = freezed,
    Object? type = freezed,
    Object? ipAddress = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_FirewallRule(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirewallRule implements _FirewallRule {
  _$_FirewallRule(
      {required this.id,
      required this.name,
      required this.port,
      required this.type,
      this.ipAddress,
      required this.status,
      required this.createdAt});

  factory _$_FirewallRule.fromJson(Map<String, dynamic> json) =>
      _$$_FirewallRuleFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String port;
  @override
  final String type;
  @override
  final String? ipAddress;
  @override
  final String status;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'FirewallRule(id: $id, name: $name, port: $port, type: $type, ipAddress: $ipAddress, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirewallRule &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$FirewallRuleCopyWith<_FirewallRule> get copyWith =>
      __$FirewallRuleCopyWithImpl<_FirewallRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirewallRuleToJson(this);
  }
}

abstract class _FirewallRule implements FirewallRule {
  factory _FirewallRule(
      {required int id,
      required String name,
      required String port,
      required String type,
      String? ipAddress,
      required String status,
      required String createdAt}) = _$_FirewallRule;

  factory _FirewallRule.fromJson(Map<String, dynamic> json) =
      _$_FirewallRule.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get port;
  @override
  String get type;
  @override
  String? get ipAddress;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$FirewallRuleCopyWith<_FirewallRule> get copyWith =>
      throw _privateConstructorUsedError;
}
