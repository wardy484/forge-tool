// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_firewall_rule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFirewallRuleResponse _$GetFirewallRuleResponseFromJson(
    Map<String, dynamic> json) {
  return _GetFirewallRuleResponse.fromJson(json);
}

/// @nodoc
class _$GetFirewallRuleResponseTearOff {
  const _$GetFirewallRuleResponseTearOff();

  _GetFirewallRuleResponse call({required FirewallRule rule}) {
    return _GetFirewallRuleResponse(
      rule: rule,
    );
  }

  GetFirewallRuleResponse fromJson(Map<String, Object?> json) {
    return GetFirewallRuleResponse.fromJson(json);
  }
}

/// @nodoc
const $GetFirewallRuleResponse = _$GetFirewallRuleResponseTearOff();

/// @nodoc
mixin _$GetFirewallRuleResponse {
  FirewallRule get rule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFirewallRuleResponseCopyWith<GetFirewallRuleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFirewallRuleResponseCopyWith<$Res> {
  factory $GetFirewallRuleResponseCopyWith(GetFirewallRuleResponse value,
          $Res Function(GetFirewallRuleResponse) then) =
      _$GetFirewallRuleResponseCopyWithImpl<$Res>;
  $Res call({FirewallRule rule});

  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class _$GetFirewallRuleResponseCopyWithImpl<$Res>
    implements $GetFirewallRuleResponseCopyWith<$Res> {
  _$GetFirewallRuleResponseCopyWithImpl(this._value, this._then);

  final GetFirewallRuleResponse _value;
  // ignore: unused_field
  final $Res Function(GetFirewallRuleResponse) _then;

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
abstract class _$GetFirewallRuleResponseCopyWith<$Res>
    implements $GetFirewallRuleResponseCopyWith<$Res> {
  factory _$GetFirewallRuleResponseCopyWith(_GetFirewallRuleResponse value,
          $Res Function(_GetFirewallRuleResponse) then) =
      __$GetFirewallRuleResponseCopyWithImpl<$Res>;
  @override
  $Res call({FirewallRule rule});

  @override
  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$GetFirewallRuleResponseCopyWithImpl<$Res>
    extends _$GetFirewallRuleResponseCopyWithImpl<$Res>
    implements _$GetFirewallRuleResponseCopyWith<$Res> {
  __$GetFirewallRuleResponseCopyWithImpl(_GetFirewallRuleResponse _value,
      $Res Function(_GetFirewallRuleResponse) _then)
      : super(_value, (v) => _then(v as _GetFirewallRuleResponse));

  @override
  _GetFirewallRuleResponse get _value =>
      super._value as _GetFirewallRuleResponse;

  @override
  $Res call({
    Object? rule = freezed,
  }) {
    return _then(_GetFirewallRuleResponse(
      rule: rule == freezed
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFirewallRuleResponse implements _GetFirewallRuleResponse {
  _$_GetFirewallRuleResponse({required this.rule});

  factory _$_GetFirewallRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetFirewallRuleResponseFromJson(json);

  @override
  final FirewallRule rule;

  @override
  String toString() {
    return 'GetFirewallRuleResponse(rule: $rule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFirewallRuleResponse &&
            const DeepCollectionEquality().equals(other.rule, rule));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rule));

  @JsonKey(ignore: true)
  @override
  _$GetFirewallRuleResponseCopyWith<_GetFirewallRuleResponse> get copyWith =>
      __$GetFirewallRuleResponseCopyWithImpl<_GetFirewallRuleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFirewallRuleResponseToJson(this);
  }
}

abstract class _GetFirewallRuleResponse implements GetFirewallRuleResponse {
  factory _GetFirewallRuleResponse({required FirewallRule rule}) =
      _$_GetFirewallRuleResponse;

  factory _GetFirewallRuleResponse.fromJson(Map<String, dynamic> json) =
      _$_GetFirewallRuleResponse.fromJson;

  @override
  FirewallRule get rule;
  @override
  @JsonKey(ignore: true)
  _$GetFirewallRuleResponseCopyWith<_GetFirewallRuleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
