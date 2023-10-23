// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_firewall_rules_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListFirewallRulesResponse _$ListFirewallRulesResponseFromJson(
    Map<String, dynamic> json) {
  return _ListFirewallRulesResponse.fromJson(json);
}

/// @nodoc
mixin _$ListFirewallRulesResponse {
  List<FirewallRule> get rules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListFirewallRulesResponseCopyWith<ListFirewallRulesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListFirewallRulesResponseCopyWith<$Res> {
  factory $ListFirewallRulesResponseCopyWith(ListFirewallRulesResponse value,
          $Res Function(ListFirewallRulesResponse) then) =
      _$ListFirewallRulesResponseCopyWithImpl<$Res, ListFirewallRulesResponse>;
  @useResult
  $Res call({List<FirewallRule> rules});
}

/// @nodoc
class _$ListFirewallRulesResponseCopyWithImpl<$Res,
        $Val extends ListFirewallRulesResponse>
    implements $ListFirewallRulesResponseCopyWith<$Res> {
  _$ListFirewallRulesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(_value.copyWith(
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<FirewallRule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListFirewallRulesResponseImplCopyWith<$Res>
    implements $ListFirewallRulesResponseCopyWith<$Res> {
  factory _$$ListFirewallRulesResponseImplCopyWith(
          _$ListFirewallRulesResponseImpl value,
          $Res Function(_$ListFirewallRulesResponseImpl) then) =
      __$$ListFirewallRulesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FirewallRule> rules});
}

/// @nodoc
class __$$ListFirewallRulesResponseImplCopyWithImpl<$Res>
    extends _$ListFirewallRulesResponseCopyWithImpl<$Res,
        _$ListFirewallRulesResponseImpl>
    implements _$$ListFirewallRulesResponseImplCopyWith<$Res> {
  __$$ListFirewallRulesResponseImplCopyWithImpl(
      _$ListFirewallRulesResponseImpl _value,
      $Res Function(_$ListFirewallRulesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(_$ListFirewallRulesResponseImpl(
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<FirewallRule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListFirewallRulesResponseImpl implements _ListFirewallRulesResponse {
  _$ListFirewallRulesResponseImpl({required final List<FirewallRule> rules})
      : _rules = rules;

  factory _$ListFirewallRulesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListFirewallRulesResponseImplFromJson(json);

  final List<FirewallRule> _rules;
  @override
  List<FirewallRule> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  String toString() {
    return 'ListFirewallRulesResponse(rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListFirewallRulesResponseImpl &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListFirewallRulesResponseImplCopyWith<_$ListFirewallRulesResponseImpl>
      get copyWith => __$$ListFirewallRulesResponseImplCopyWithImpl<
          _$ListFirewallRulesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListFirewallRulesResponseImplToJson(
      this,
    );
  }
}

abstract class _ListFirewallRulesResponse implements ListFirewallRulesResponse {
  factory _ListFirewallRulesResponse(
          {required final List<FirewallRule> rules}) =
      _$ListFirewallRulesResponseImpl;

  factory _ListFirewallRulesResponse.fromJson(Map<String, dynamic> json) =
      _$ListFirewallRulesResponseImpl.fromJson;

  @override
  List<FirewallRule> get rules;
  @override
  @JsonKey(ignore: true)
  _$$ListFirewallRulesResponseImplCopyWith<_$ListFirewallRulesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
