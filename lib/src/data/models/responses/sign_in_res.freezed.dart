// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInRes _$SignInResFromJson(Map<String, dynamic> json) {
  return _SignInRes.fromJson(json);
}

/// @nodoc
mixin _$SignInRes {
  UserEntity? get info => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResCopyWith<SignInRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResCopyWith<$Res> {
  factory $SignInResCopyWith(SignInRes value, $Res Function(SignInRes) then) =
      _$SignInResCopyWithImpl<$Res>;
  $Res call({UserEntity? info, String? accessToken});

  $UserEntityCopyWith<$Res>? get info;
}

/// @nodoc
class _$SignInResCopyWithImpl<$Res> implements $SignInResCopyWith<$Res> {
  _$SignInResCopyWithImpl(this._value, this._then);

  final SignInRes _value;
  // ignore: unused_field
  final $Res Function(SignInRes) _then;

  @override
  $Res call({
    Object? info = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserEntityCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc
abstract class _$$_SignInResCopyWith<$Res> implements $SignInResCopyWith<$Res> {
  factory _$$_SignInResCopyWith(
          _$_SignInRes value, $Res Function(_$_SignInRes) then) =
      __$$_SignInResCopyWithImpl<$Res>;
  @override
  $Res call({UserEntity? info, String? accessToken});

  @override
  $UserEntityCopyWith<$Res>? get info;
}

/// @nodoc
class __$$_SignInResCopyWithImpl<$Res> extends _$SignInResCopyWithImpl<$Res>
    implements _$$_SignInResCopyWith<$Res> {
  __$$_SignInResCopyWithImpl(
      _$_SignInRes _value, $Res Function(_$_SignInRes) _then)
      : super(_value, (v) => _then(v as _$_SignInRes));

  @override
  _$_SignInRes get _value => super._value as _$_SignInRes;

  @override
  $Res call({
    Object? info = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_SignInRes(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInRes with DiagnosticableTreeMixin implements _SignInRes {
  const _$_SignInRes({this.info, this.accessToken});

  factory _$_SignInRes.fromJson(Map<String, dynamic> json) =>
      _$$_SignInResFromJson(json);

  @override
  final UserEntity? info;
  @override
  final String? accessToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInRes(info: $info, accessToken: $accessToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInRes'))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('accessToken', accessToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInRes &&
            const DeepCollectionEquality().equals(other.info, info) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(info),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$$_SignInResCopyWith<_$_SignInRes> get copyWith =>
      __$$_SignInResCopyWithImpl<_$_SignInRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInResToJson(this);
  }
}

abstract class _SignInRes implements SignInRes {
  const factory _SignInRes(
      {final UserEntity? info, final String? accessToken}) = _$_SignInRes;

  factory _SignInRes.fromJson(Map<String, dynamic> json) =
      _$_SignInRes.fromJson;

  @override
  UserEntity? get info => throw _privateConstructorUsedError;
  @override
  String? get accessToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInResCopyWith<_$_SignInRes> get copyWith =>
      throw _privateConstructorUsedError;
}
