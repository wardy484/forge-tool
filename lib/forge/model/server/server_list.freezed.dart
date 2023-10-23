// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerList _$ServerListFromJson(Map<String, dynamic> json) {
  return _ServerList.fromJson(json);
}

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
      _$ServerListCopyWithImpl<$Res, ServerList>;
  @useResult
  $Res call({List<Server> servers});
}

/// @nodoc
class _$ServerListCopyWithImpl<$Res, $Val extends ServerList>
    implements $ServerListCopyWith<$Res> {
  _$ServerListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servers = null,
  }) {
    return _then(_value.copyWith(
      servers: null == servers
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerListImplCopyWith<$Res>
    implements $ServerListCopyWith<$Res> {
  factory _$$ServerListImplCopyWith(
          _$ServerListImpl value, $Res Function(_$ServerListImpl) then) =
      __$$ServerListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Server> servers});
}

/// @nodoc
class __$$ServerListImplCopyWithImpl<$Res>
    extends _$ServerListCopyWithImpl<$Res, _$ServerListImpl>
    implements _$$ServerListImplCopyWith<$Res> {
  __$$ServerListImplCopyWithImpl(
      _$ServerListImpl _value, $Res Function(_$ServerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servers = null,
  }) {
    return _then(_$ServerListImpl(
      servers: null == servers
          ? _value._servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerListImpl implements _ServerList {
  _$ServerListImpl({required final List<Server> servers}) : _servers = servers;

  factory _$ServerListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerListImplFromJson(json);

  final List<Server> _servers;
  @override
  List<Server> get servers {
    if (_servers is EqualUnmodifiableListView) return _servers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servers);
  }

  @override
  String toString() {
    return 'ServerList(servers: $servers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerListImpl &&
            const DeepCollectionEquality().equals(other._servers, _servers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_servers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerListImplCopyWith<_$ServerListImpl> get copyWith =>
      __$$ServerListImplCopyWithImpl<_$ServerListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerListImplToJson(
      this,
    );
  }
}

abstract class _ServerList implements ServerList {
  factory _ServerList({required final List<Server> servers}) = _$ServerListImpl;

  factory _ServerList.fromJson(Map<String, dynamic> json) =
      _$ServerListImpl.fromJson;

  @override
  List<Server> get servers;
  @override
  @JsonKey(ignore: true)
  _$$ServerListImplCopyWith<_$ServerListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
