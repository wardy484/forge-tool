// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_firewall_rule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateFirewallRuleResponse _$CreateFirewallRuleResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateFirewallRuleResponse.fromJson(json);
}

/// @nodoc
class _$CreateFirewallRuleResponseTearOff {
  const _$CreateFirewallRuleResponseTearOff();

  _CreateFirewallRuleResponse call({required FirewallRule rule}) {
    return _CreateFirewallRuleResponse(
      rule: rule,
    );
  }

  CreateFirewallRuleResponse fromJson(Map<String, Object?> json) {
    return CreateFirewallRuleResponse.fromJson(json);
  }
}

/// @nodoc
const $CreateFirewallRuleResponse = _$CreateFirewallRuleResponseTearOff();

/// @nodoc
mixin _$CreateFirewallRuleResponse {
  FirewallRule get rule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateFirewallRuleResponseCopyWith<CreateFirewallRuleResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFirewallRuleResponseCopyWith<$Res> {
  factory $CreateFirewallRuleResponseCopyWith(CreateFirewallRuleResponse value,
          $Res Function(CreateFirewallRuleResponse) then) =
      _$CreateFirewallRuleResponseCopyWithImpl<$Res>;
  $Res call({FirewallRule rule});

  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class _$CreateFirewallRuleResponseCopyWithImpl<$Res>
    implements $CreateFirewallRuleResponseCopyWith<$Res> {
  _$CreateFirewallRuleResponseCopyWithImpl(this._value, this._then);

  final CreateFirewallRuleResponse _value;
  // ignore: unused_field
  final $Res Function(CreateFirewallRuleResponse) _then;

  @override
  $Res call({
    Object? rule = freezed,
  }) {
    return _then(_value.copyWith(
      rule: rule == freezed
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ));
  }

  @override
  $FirewallRuleCopyWith<$Res> get rule {
    return $FirewallRuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value));
    });
  }
}

/// @nodoc
abstract class _$CreateFirewallRuleResponseCopyWith<$Res>
    implements $CreateFirewallRuleResponseCopyWith<$Res> {
  factory _$CreateFirewallRuleResponseCopyWith(
          _CreateFirewallRuleResponse value,
          $Res Function(_CreateFirewallRuleResponse) then) =
      __$CreateFirewallRuleResponseCopyWithImpl<$Res>;
  @override
  $Res call({FirewallRule rule});

  @override
  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$CreateFirewallRuleResponseCopyWithImpl<$Res>
    extends _$CreateFirewallRuleResponseCopyWithImpl<$Res>
    implements _$CreateFirewallRuleResponseCopyWith<$Res> {
  __$CreateFirewallRuleResponseCopyWithImpl(_CreateFirewallRuleResponse _value,
      $Res Function(_CreateFirewallRuleResponse) _then)
      : super(_value, (v) => _then(v as _CreateFirewallRuleResponse));

  @override
  _CreateFirewallRuleResponse get _value =>
      super._value as _CreateFirewallRuleResponse;

  @override
  $Res call({
    Object? rule = freezed,
  }) {
    return _then(_CreateFirewallRuleResponse(
      rule: rule == freezed
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateFirewallRuleResponse implements _CreateFirewallRuleResponse {
  _$_CreateFirewallRuleResponse({required this.rule});

  factory _$_CreateFirewallRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CreateFirewallRuleResponseFromJson(json);

  @override
  final FirewallRule rule;

  @override
  String toString() {
    return 'CreateFirewallRuleResponse(rule: $rule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateFirewallRuleResponse &&
            const DeepCollectionEquality().equals(other.rule, rule));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rule));

  @JsonKey(ignore: true)
  @override
  _$CreateFirewallRuleResponseCopyWith<_CreateFirewallRuleResponse>
      get copyWith => __$CreateFirewallRuleResponseCopyWithImpl<
          _CreateFirewallRuleResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateFirewallRuleResponseToJson(this);
  }
}

abstract class _CreateFirewallRuleResponse
    implements CreateFirewallRuleResponse {
  factory _CreateFirewallRuleResponse({required FirewallRule rule}) =
      _$_CreateFirewallRuleResponse;

  factory _CreateFirewallRuleResponse.fromJson(Map<String, dynamic> json) =
      _$_CreateFirewallRuleResponse.fromJson;

  @override
  FirewallRule get rule;
  @override
  @JsonKey(ignore: true)
  _$CreateFirewallRuleResponseCopyWith<_CreateFirewallRuleResponse>
      get copyWith => throw _privateConstructorUsedError;
}
