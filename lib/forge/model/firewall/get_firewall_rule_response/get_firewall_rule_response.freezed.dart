// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_firewall_rule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFirewallRuleResponse _$GetFirewallRuleResponseFromJson(
    Map<String, dynamic> json) {
  return _GetFirewallRuleResponse.fromJson(json);
}

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
      _$GetFirewallRuleResponseCopyWithImpl<$Res, GetFirewallRuleResponse>;
  @useResult
  $Res call({FirewallRule rule});

  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class _$GetFirewallRuleResponseCopyWithImpl<$Res,
        $Val extends GetFirewallRuleResponse>
    implements $GetFirewallRuleResponseCopyWith<$Res> {
  _$GetFirewallRuleResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$GetFirewallRuleResponseImplCopyWith<$Res>
    implements $GetFirewallRuleResponseCopyWith<$Res> {
  factory _$$GetFirewallRuleResponseImplCopyWith(
          _$GetFirewallRuleResponseImpl value,
          $Res Function(_$GetFirewallRuleResponseImpl) then) =
      __$$GetFirewallRuleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FirewallRule rule});

  @override
  $FirewallRuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$$GetFirewallRuleResponseImplCopyWithImpl<$Res>
    extends _$GetFirewallRuleResponseCopyWithImpl<$Res,
        _$GetFirewallRuleResponseImpl>
    implements _$$GetFirewallRuleResponseImplCopyWith<$Res> {
  __$$GetFirewallRuleResponseImplCopyWithImpl(
      _$GetFirewallRuleResponseImpl _value,
      $Res Function(_$GetFirewallRuleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
  }) {
    return _then(_$GetFirewallRuleResponseImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as FirewallRule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFirewallRuleResponseImpl implements _GetFirewallRuleResponse {
  _$GetFirewallRuleResponseImpl({required this.rule});

  factory _$GetFirewallRuleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFirewallRuleResponseImplFromJson(json);

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
            other is _$GetFirewallRuleResponseImpl &&
            (identical(other.rule, rule) || other.rule == rule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFirewallRuleResponseImplCopyWith<_$GetFirewallRuleResponseImpl>
      get copyWith => __$$GetFirewallRuleResponseImplCopyWithImpl<
          _$GetFirewallRuleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFirewallRuleResponseImplToJson(
      this,
    );
  }
}

abstract class _GetFirewallRuleResponse implements GetFirewallRuleResponse {
  factory _GetFirewallRuleResponse({required final FirewallRule rule}) =
      _$GetFirewallRuleResponseImpl;

  factory _GetFirewallRuleResponse.fromJson(Map<String, dynamic> json) =
      _$GetFirewallRuleResponseImpl.fromJson;

  @override
  FirewallRule get rule;
  @override
  @JsonKey(ignore: true)
  _$$GetFirewallRuleResponseImplCopyWith<_$GetFirewallRuleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
