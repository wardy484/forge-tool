// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_firewall_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateFirewallRule _$CreateFirewallRuleFromJson(Map<String, dynamic> json) {
  return _CreateFirewallRule.fromJson(json);
}

/// @nodoc
class _$CreateFirewallRuleTearOff {
  const _$CreateFirewallRuleTearOff();

  _CreateFirewallRule call(
      {required String name,
      String? ipAddress,
      required int port,
      required String type}) {
    return _CreateFirewallRule(
      name: name,
      ipAddress: ipAddress,
      port: port,
      type: type,
    );
  }

  CreateFirewallRule fromJson(Map<String, Object?> json) {
    return CreateFirewallRule.fromJson(json);
  }
}

/// @nodoc
const $CreateFirewallRule = _$CreateFirewallRuleTearOff();

/// @nodoc
mixin _$CreateFirewallRule {
  String get name => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateFirewallRuleCopyWith<CreateFirewallRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFirewallRuleCopyWith<$Res> {
  factory $CreateFirewallRuleCopyWith(
          CreateFirewallRule value, $Res Function(CreateFirewallRule) then) =
      _$CreateFirewallRuleCopyWithImpl<$Res>;
  $Res call({String name, String? ipAddress, int port, String type});
}

/// @nodoc
class _$CreateFirewallRuleCopyWithImpl<$Res>
    implements $CreateFirewallRuleCopyWith<$Res> {
  _$CreateFirewallRuleCopyWithImpl(this._value, this._then);

  final CreateFirewallRule _value;
  // ignore: unused_field
  final $Res Function(CreateFirewallRule) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? ipAddress = freezed,
    Object? port = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateFirewallRuleCopyWith<$Res>
    implements $CreateFirewallRuleCopyWith<$Res> {
  factory _$CreateFirewallRuleCopyWith(
          _CreateFirewallRule value, $Res Function(_CreateFirewallRule) then) =
      __$CreateFirewallRuleCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? ipAddress, int port, String type});
}

/// @nodoc
class __$CreateFirewallRuleCopyWithImpl<$Res>
    extends _$CreateFirewallRuleCopyWithImpl<$Res>
    implements _$CreateFirewallRuleCopyWith<$Res> {
  __$CreateFirewallRuleCopyWithImpl(
      _CreateFirewallRule _value, $Res Function(_CreateFirewallRule) _then)
      : super(_value, (v) => _then(v as _CreateFirewallRule));

  @override
  _CreateFirewallRule get _value => super._value as _CreateFirewallRule;

  @override
  $Res call({
    Object? name = freezed,
    Object? ipAddress = freezed,
    Object? port = freezed,
    Object? type = freezed,
  }) {
    return _then(_CreateFirewallRule(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateFirewallRule implements _CreateFirewallRule {
  _$_CreateFirewallRule(
      {required this.name,
      this.ipAddress,
      required this.port,
      required this.type});

  factory _$_CreateFirewallRule.fromJson(Map<String, dynamic> json) =>
      _$$_CreateFirewallRuleFromJson(json);

  @override
  final String name;
  @override
  final String? ipAddress;
  @override
  final int port;
  @override
  final String type;

  @override
  String toString() {
    return 'CreateFirewallRule(name: $name, ipAddress: $ipAddress, port: $port, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateFirewallRule &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$CreateFirewallRuleCopyWith<_CreateFirewallRule> get copyWith =>
      __$CreateFirewallRuleCopyWithImpl<_CreateFirewallRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateFirewallRuleToJson(this);
  }
}

abstract class _CreateFirewallRule implements CreateFirewallRule {
  factory _CreateFirewallRule(
      {required String name,
      String? ipAddress,
      required int port,
      required String type}) = _$_CreateFirewallRule;

  factory _CreateFirewallRule.fromJson(Map<String, dynamic> json) =
      _$_CreateFirewallRule.fromJson;

  @override
  String get name;
  @override
  String? get ipAddress;
  @override
  int get port;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$CreateFirewallRuleCopyWith<_CreateFirewallRule> get copyWith =>
      throw _privateConstructorUsedError;
}
