// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_firewall_rules_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListFirewallRulesResponse _$ListFirewallRulesResponseFromJson(
    Map<String, dynamic> json) {
  return _ListFirewallRulesResponse.fromJson(json);
}

/// @nodoc
class _$ListFirewallRulesResponseTearOff {
  const _$ListFirewallRulesResponseTearOff();

  _ListFirewallRulesResponse call({required List<FirewallRule> rules}) {
    return _ListFirewallRulesResponse(
      rules: rules,
    );
  }

  ListFirewallRulesResponse fromJson(Map<String, Object?> json) {
    return ListFirewallRulesResponse.fromJson(json);
  }
}

/// @nodoc
const $ListFirewallRulesResponse = _$ListFirewallRulesResponseTearOff();

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
      _$ListFirewallRulesResponseCopyWithImpl<$Res>;
  $Res call({List<FirewallRule> rules});
}

/// @nodoc
class _$ListFirewallRulesResponseCopyWithImpl<$Res>
    implements $ListFirewallRulesResponseCopyWith<$Res> {
  _$ListFirewallRulesResponseCopyWithImpl(this._value, this._then);

  final ListFirewallRulesResponse _value;
  // ignore: unused_field
  final $Res Function(ListFirewallRulesResponse) _then;

  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_value.copyWith(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<FirewallRule>,
    ));
  }
}

/// @nodoc
abstract class _$ListFirewallRulesResponseCopyWith<$Res>
    implements $ListFirewallRulesResponseCopyWith<$Res> {
  factory _$ListFirewallRulesResponseCopyWith(_ListFirewallRulesResponse value,
          $Res Function(_ListFirewallRulesResponse) then) =
      __$ListFirewallRulesResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<FirewallRule> rules});
}

/// @nodoc
class __$ListFirewallRulesResponseCopyWithImpl<$Res>
    extends _$ListFirewallRulesResponseCopyWithImpl<$Res>
    implements _$ListFirewallRulesResponseCopyWith<$Res> {
  __$ListFirewallRulesResponseCopyWithImpl(_ListFirewallRulesResponse _value,
      $Res Function(_ListFirewallRulesResponse) _then)
      : super(_value, (v) => _then(v as _ListFirewallRulesResponse));

  @override
  _ListFirewallRulesResponse get _value =>
      super._value as _ListFirewallRulesResponse;

  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_ListFirewallRulesResponse(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<FirewallRule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListFirewallRulesResponse implements _ListFirewallRulesResponse {
  _$_ListFirewallRulesResponse({required this.rules});

  factory _$_ListFirewallRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListFirewallRulesResponseFromJson(json);

  @override
  final List<FirewallRule> rules;

  @override
  String toString() {
    return 'ListFirewallRulesResponse(rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListFirewallRulesResponse &&
            const DeepCollectionEquality().equals(other.rules, rules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rules));

  @JsonKey(ignore: true)
  @override
  _$ListFirewallRulesResponseCopyWith<_ListFirewallRulesResponse>
      get copyWith =>
          __$ListFirewallRulesResponseCopyWithImpl<_ListFirewallRulesResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListFirewallRulesResponseToJson(this);
  }
}

abstract class _ListFirewallRulesResponse implements ListFirewallRulesResponse {
  factory _ListFirewallRulesResponse({required List<FirewallRule> rules}) =
      _$_ListFirewallRulesResponse;

  factory _ListFirewallRulesResponse.fromJson(Map<String, dynamic> json) =
      _$_ListFirewallRulesResponse.fromJson;

  @override
  List<FirewallRule> get rules;
  @override
  @JsonKey(ignore: true)
  _$ListFirewallRulesResponseCopyWith<_ListFirewallRulesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
