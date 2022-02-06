// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerList _$ServerListFromJson(Map<String, dynamic> json) {
  return _ServerList.fromJson(json);
}

/// @nodoc
class _$ServerListTearOff {
  const _$ServerListTearOff();

  _ServerList call({required List<Server> servers}) {
    return _ServerList(
      servers: servers,
    );
  }

  ServerList fromJson(Map<String, Object?> json) {
    return ServerList.fromJson(json);
  }
}

/// @nodoc
const $ServerList = _$ServerListTearOff();

/// @nodoc
mixin _$ServerList {
  List<Server> get servers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerListCopyWith<ServerList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerListCopyWith<$Res> {
  factory $ServerListCopyWith(
          ServerList value, $Res Function(ServerList) then) =
      _$ServerListCopyWithImpl<$Res>;
  $Res call({List<Server> servers});
}

/// @nodoc
class _$ServerListCopyWithImpl<$Res> implements $ServerListCopyWith<$Res> {
  _$ServerListCopyWithImpl(this._value, this._then);

  final ServerList _value;
  // ignore: unused_field
  final $Res Function(ServerList) _then;

  @override
  $Res call({
    Object? servers = freezed,
  }) {
    return _then(_value.copyWith(
      servers: servers == freezed
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
    ));
  }
}

/// @nodoc
abstract class _$ServerListCopyWith<$Res> implements $ServerListCopyWith<$Res> {
  factory _$ServerListCopyWith(
          _ServerList value, $Res Function(_ServerList) then) =
      __$ServerListCopyWithImpl<$Res>;
  @override
  $Res call({List<Server> servers});
}

/// @nodoc
class __$ServerListCopyWithImpl<$Res> extends _$ServerListCopyWithImpl<$Res>
    implements _$ServerListCopyWith<$Res> {
  __$ServerListCopyWithImpl(
      _ServerList _value, $Res Function(_ServerList) _then)
      : super(_value, (v) => _then(v as _ServerList));

  @override
  _ServerList get _value => super._value as _ServerList;

  @override
  $Res call({
    Object? servers = freezed,
  }) {
    return _then(_ServerList(
      servers: servers == freezed
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerList implements _ServerList {
  _$_ServerList({required this.servers});

  factory _$_ServerList.fromJson(Map<String, dynamic> json) =>
      _$$_ServerListFromJson(json);

  @override
  final List<Server> servers;

  @override
  String toString() {
    return 'ServerList(servers: $servers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerList &&
            const DeepCollectionEquality().equals(other.servers, servers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(servers));

  @JsonKey(ignore: true)
  @override
  _$ServerListCopyWith<_ServerList> get copyWith =>
      __$ServerListCopyWithImpl<_ServerList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerListToJson(this);
  }
}

abstract class _ServerList implements ServerList {
  factory _ServerList({required List<Server> servers}) = _$_ServerList;

  factory _ServerList.fromJson(Map<String, dynamic> json) =
      _$_ServerList.fromJson;

  @override
  List<Server> get servers;
  @override
  @JsonKey(ignore: true)
  _$ServerListCopyWith<_ServerList> get copyWith =>
      throw _privateConstructorUsedError;
}
