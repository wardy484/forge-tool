// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_firewall_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateFirewallRule _$CreateFirewallRuleFromJson(Map<String, dynamic> json) {
  return _CreateFirewallRule.fromJson(json);
}

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
      _$CreateFirewallRuleCopyWithImpl<$Res, CreateFirewallRule>;
  @useResult
  $Res call({String name, String? ipAddress, int port, String type});
}

/// @nodoc
class _$CreateFirewallRuleCopyWithImpl<$Res, $Val extends CreateFirewallRule>
    implements $CreateFirewallRuleCopyWith<$Res> {
  _$CreateFirewallRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ipAddress = freezed,
    Object? port = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFirewallRuleImplCopyWith<$Res>
    implements $CreateFirewallRuleCopyWith<$Res> {
  factory _$$CreateFirewallRuleImplCopyWith(_$CreateFirewallRuleImpl value,
          $Res Function(_$CreateFirewallRuleImpl) then) =
      __$$CreateFirewallRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? ipAddress, int port, String type});
}

/// @nodoc
class __$$CreateFirewallRuleImplCopyWithImpl<$Res>
    extends _$CreateFirewallRuleCopyWithImpl<$Res, _$CreateFirewallRuleImpl>
    implements _$$CreateFirewallRuleImplCopyWith<$Res> {
  __$$CreateFirewallRuleImplCopyWithImpl(_$CreateFirewallRuleImpl _value,
      $Res Function(_$CreateFirewallRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ipAddress = freezed,
    Object? port = null,
    Object? type = null,
  }) {
    return _then(_$CreateFirewallRuleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFirewallRuleImpl implements _CreateFirewallRule {
  _$CreateFirewallRuleImpl(
      {required this.name,
      this.ipAddress,
      required this.port,
      required this.type});

  factory _$CreateFirewallRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFirewallRuleImplFromJson(json);

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
            other is _$CreateFirewallRuleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, ipAddress, port, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFirewallRuleImplCopyWith<_$CreateFirewallRuleImpl> get copyWith =>
      __$$CreateFirewallRuleImplCopyWithImpl<_$CreateFirewallRuleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFirewallRuleImplToJson(
      this,
    );
  }
}

abstract class _CreateFirewallRule implements CreateFirewallRule {
  factory _CreateFirewallRule(
      {required final String name,
      final String? ipAddress,
      required final int port,
      required final String type}) = _$CreateFirewallRuleImpl;

  factory _CreateFirewallRule.fromJson(Map<String, dynamic> json) =
      _$CreateFirewallRuleImpl.fromJson;

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
  _$$CreateFirewallRuleImplCopyWith<_$CreateFirewallRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
