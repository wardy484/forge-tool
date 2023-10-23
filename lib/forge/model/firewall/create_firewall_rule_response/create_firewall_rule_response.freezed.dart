// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_firewall_rule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateFirewallRuleResponse _$CreateFirewallRuleResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateFirewallRuleResponse.fromJson(json);
}

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
      _$CreateFirewallRuleResponseCopyWithImpl<$Res,
          CreateFirewallRuleResponse>;
  @useResult
  $Res call({FirewallRule rule});

  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class _$CreateFirewallRuleResponseCopyWithImpl<$Res,
        $Val extends CreateFirewallRuleResponse>
    implements $CreateFirewallRuleResponseCopyWith<$Res> {
  _$CreateFirewallRuleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
  }) {
    return _then(_value.copyWith(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirewallRuleCopyWith<$Res> get rule {
    return $FirewallRuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateFirewallRuleResponseImplCopyWith<$Res>
    implements $CreateFirewallRuleResponseCopyWith<$Res> {
  factory _$$CreateFirewallRuleResponseImplCopyWith(
          _$CreateFirewallRuleResponseImpl value,
          $Res Function(_$CreateFirewallRuleResponseImpl) then) =
      __$$CreateFirewallRuleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FirewallRule rule});

  @override
  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$$CreateFirewallRuleResponseImplCopyWithImpl<$Res>
    extends _$CreateFirewallRuleResponseCopyWithImpl<$Res,
        _$CreateFirewallRuleResponseImpl>
    implements _$$CreateFirewallRuleResponseImplCopyWith<$Res> {
  __$$CreateFirewallRuleResponseImplCopyWithImpl(
      _$CreateFirewallRuleResponseImpl _value,
      $Res Function(_$CreateFirewallRuleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
  }) {
    return _then(_$CreateFirewallRuleResponseImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFirewallRuleResponseImpl implements _CreateFirewallRuleResponse {
  _$CreateFirewallRuleResponseImpl({required this.rule});

  factory _$CreateFirewallRuleResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateFirewallRuleResponseImplFromJson(json);

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
            other is _$CreateFirewallRuleResponseImpl &&
            (identical(other.rule, rule) || other.rule == rule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFirewallRuleResponseImplCopyWith<_$CreateFirewallRuleResponseImpl>
      get copyWith => __$$CreateFirewallRuleResponseImplCopyWithImpl<
          _$CreateFirewallRuleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFirewallRuleResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateFirewallRuleResponse
    implements CreateFirewallRuleResponse {
  factory _CreateFirewallRuleResponse({required final FirewallRule rule}) =
      _$CreateFirewallRuleResponseImpl;

  factory _CreateFirewallRuleResponse.fromJson(Map<String, dynamic> json) =
      _$CreateFirewallRuleResponseImpl.fromJson;

  @override
  FirewallRule get rule;
  @override
  @JsonKey(ignore: true)
  _$$CreateFirewallRuleResponseImplCopyWith<_$CreateFirewallRuleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
