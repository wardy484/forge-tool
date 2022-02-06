// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return _Rule.fromJson(json);
}

/// @nodoc
class _$RuleTearOff {
  const _$RuleTearOff();

  _Rule call(
      {int? id,
      String? name,
      int? port,
      String? type,
      @JsonKey(name: 'ip_address') dynamic ipAddress,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt}) {
    return _Rule(
      id: id,
      name: name,
      port: port,
      type: type,
      ipAddress: ipAddress,
      status: status,
      createdAt: createdAt,
    );
  }

  Rule fromJson(Map<String, Object?> json) {
    return Rule.fromJson(json);
  }
}

/// @nodoc
const $Rule = _$RuleTearOff();

/// @nodoc
mixin _$Rule {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  dynamic get ipAddress => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuleCopyWith<Rule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleCopyWith<$Res> {
  factory $RuleCopyWith(Rule value, $Res Function(Rule) then) =
      _$RuleCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      int? port,
      String? type,
      @JsonKey(name: 'ip_address') dynamic ipAddress,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$RuleCopyWithImpl<$Res> implements $RuleCopyWith<$Res> {
  _$RuleCopyWithImpl(this._value, this._then);

  final Rule _value;
  // ignore: unused_field
  final $Res Function(Rule) _then;

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
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RuleCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$RuleCopyWith(_Rule value, $Res Function(_Rule) then) =
      __$RuleCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      int? port,
      String? type,
      @JsonKey(name: 'ip_address') dynamic ipAddress,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$RuleCopyWithImpl<$Res> extends _$RuleCopyWithImpl<$Res>
    implements _$RuleCopyWith<$Res> {
  __$RuleCopyWithImpl(_Rule _value, $Res Function(_Rule) _then)
      : super(_value, (v) => _then(v as _Rule));

  @override
  _Rule get _value => super._value as _Rule;

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
    return _then(_Rule(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rule implements _Rule {
  _$_Rule(
      {this.id,
      this.name,
      this.port,
      this.type,
      @JsonKey(name: 'ip_address') this.ipAddress,
      this.status,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$_Rule.fromJson(Map<String, dynamic> json) => _$$_RuleFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? port;
  @override
  final String? type;
  @override
  @JsonKey(name: 'ip_address')
  final dynamic ipAddress;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'Rule(id: $id, name: $name, port: $port, type: $type, ipAddress: $ipAddress, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Rule &&
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
  _$RuleCopyWith<_Rule> get copyWith =>
      __$RuleCopyWithImpl<_Rule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RuleToJson(this);
  }
}

abstract class _Rule implements Rule {
  factory _Rule(
      {int? id,
      String? name,
      int? port,
      String? type,
      @JsonKey(name: 'ip_address') dynamic ipAddress,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt}) = _$_Rule;

  factory _Rule.fromJson(Map<String, dynamic> json) = _$_Rule.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get port;
  @override
  String? get type;
  @override
  @JsonKey(name: 'ip_address')
  dynamic get ipAddress;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$RuleCopyWith<_Rule> get copyWith => throw _privateConstructorUsedError;
}
