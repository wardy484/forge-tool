// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteList _$SiteListFromJson(Map<String, dynamic> json) {
  return _SiteInfo.fromJson(json);
}

/// @nodoc
mixin _$SiteList {
  List<Site> get sites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteListCopyWith<SiteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteListCopyWith<$Res> {
  factory $SiteListCopyWith(SiteList value, $Res Function(SiteList) then) =
      _$SiteListCopyWithImpl<$Res, SiteList>;
  @useResult
  $Res call({List<Site> sites});
}

/// @nodoc
class _$SiteListCopyWithImpl<$Res, $Val extends SiteList>
    implements $SiteListCopyWith<$Res> {
  _$SiteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sites = null,
  }) {
    return _then(_value.copyWith(
      sites: null == sites
          ? _value.sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<Site>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteInfoImplCopyWith<$Res>
    implements $SiteListCopyWith<$Res> {
  factory _$$SiteInfoImplCopyWith(
          _$SiteInfoImpl value, $Res Function(_$SiteInfoImpl) then) =
      __$$SiteInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Site> sites});
}

/// @nodoc
class __$$SiteInfoImplCopyWithImpl<$Res>
    extends _$SiteListCopyWithImpl<$Res, _$SiteInfoImpl>
    implements _$$SiteInfoImplCopyWith<$Res> {
  __$$SiteInfoImplCopyWithImpl(
      _$SiteInfoImpl _value, $Res Function(_$SiteInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sites = null,
  }) {
    return _then(_$SiteInfoImpl(
      sites: null == sites
          ? _value._sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<Site>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteInfoImpl implements _SiteInfo {
  const _$SiteInfoImpl({required final List<Site> sites}) : _sites = sites;

  factory _$SiteInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteInfoImplFromJson(json);

  final List<Site> _sites;
  @override
  List<Site> get sites {
    if (_sites is EqualUnmodifiableListView) return _sites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sites);
  }

  @override
  String toString() {
    return 'SiteList(sites: $sites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteInfoImpl &&
            const DeepCollectionEquality().equals(other._sites, _sites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteInfoImplCopyWith<_$SiteInfoImpl> get copyWith =>
      __$$SiteInfoImplCopyWithImpl<_$SiteInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteInfoImplToJson(
      this,
    );
  }
}

abstract class _SiteInfo implements SiteList {
  const factory _SiteInfo({required final List<Site> sites}) = _$SiteInfoImpl;

  factory _SiteInfo.fromJson(Map<String, dynamic> json) =
      _$SiteInfoImpl.fromJson;

  @override
  List<Site> get sites;
  @override
  @JsonKey(ignore: true)
  _$$SiteInfoImplCopyWith<_$SiteInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
