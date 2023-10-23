// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firewall_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirewallRule _$FirewallRuleFromJson(Map<String, dynamic> json) {
  return _FirewallRule.fromJson(json);
}

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
      _$FirewallRuleCopyWithImpl<$Res, FirewallRule>;
  @useResult
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
class _$FirewallRuleCopyWithImpl<$Res, $Val extends FirewallRule>
    implements $FirewallRuleCopyWith<$Res> {
  _$FirewallRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? port = null,
    Object? type = null,
    Object? ipAddress = freezed,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirewallRuleImplCopyWith<$Res>
    implements $FirewallRuleCopyWith<$Res> {
  factory _$$FirewallRuleImplCopyWith(
          _$FirewallRuleImpl value, $Res Function(_$FirewallRuleImpl) then) =
      __$$FirewallRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$FirewallRuleImplCopyWithImpl<$Res>
    extends _$FirewallRuleCopyWithImpl<$Res, _$FirewallRuleImpl>
    implements _$$FirewallRuleImplCopyWith<$Res> {
  __$$FirewallRuleImplCopyWithImpl(
      _$FirewallRuleImpl _value, $Res Function(_$FirewallRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? port = null,
    Object? type = null,
    Object? ipAddress = freezed,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$FirewallRuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirewallRuleImpl implements _FirewallRule {
  _$FirewallRuleImpl(
      {required this.id,
      required this.name,
      required this.port,
      required this.type,
      this.ipAddress,
      required this.status,
      required this.createdAt});

  factory _$FirewallRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirewallRuleImplFromJson(json);

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
            other is _$FirewallRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, port, type, ipAddress, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirewallRuleImplCopyWith<_$FirewallRuleImpl> get copyWith =>
      __$$FirewallRuleImplCopyWithImpl<_$FirewallRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirewallRuleImplToJson(
      this,
    );
  }
}

abstract class _FirewallRule implements FirewallRule {
  factory _FirewallRule(
      {required final int id,
      required final String name,
      required final String port,
      required final String type,
      final String? ipAddress,
      required final String status,
      required final String createdAt}) = _$FirewallRuleImpl;

  factory _FirewallRule.fromJson(Map<String, dynamic> json) =
      _$FirewallRuleImpl.fromJson;

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
  _$$FirewallRuleImplCopyWith<_$FirewallRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
