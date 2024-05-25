// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInRes _$SignInResFromJson(Map<String, dynamic> json) {
  return _SignInRes.fromJson(json);
}

/// @nodoc
mixin _$SignInRes {
  String get jwt => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResCopyWith<SignInRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResCopyWith<$Res> {
  factory $SignInResCopyWith(SignInRes value, $Res Function(SignInRes) then) =
      _$SignInResCopyWithImpl<$Res, SignInRes>;
  @useResult
  $Res call({String jwt, UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$SignInResCopyWithImpl<$Res, $Val extends SignInRes>
    implements $SignInResCopyWith<$Res> {
  _$SignInResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInResImplCopyWith<$Res>
    implements $SignInResCopyWith<$Res> {
  factory _$$SignInResImplCopyWith(
          _$SignInResImpl value, $Res Function(_$SignInResImpl) then) =
      __$$SignInResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jwt, UserEntity user});

  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignInResImplCopyWithImpl<$Res>
    extends _$SignInResCopyWithImpl<$Res, _$SignInResImpl>
    implements _$$SignInResImplCopyWith<$Res> {
  __$$SignInResImplCopyWithImpl(
      _$SignInResImpl _value, $Res Function(_$SignInResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? user = null,
  }) {
    return _then(_$SignInResImpl(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResImpl implements _SignInRes {
  const _$SignInResImpl({required this.jwt, required this.user});

  factory _$SignInResImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResImplFromJson(json);

  @override
  final String jwt;
  @override
  final UserEntity user;

  @override
  String toString() {
    return 'SignInRes(jwt: $jwt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResImpl &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jwt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResImplCopyWith<_$SignInResImpl> get copyWith =>
      __$$SignInResImplCopyWithImpl<_$SignInResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResImplToJson(
      this,
    );
  }
}

abstract class _SignInRes implements SignInRes {
  const factory _SignInRes(
      {required final String jwt,
      required final UserEntity user}) = _$SignInResImpl;

  factory _SignInRes.fromJson(Map<String, dynamic> json) =
      _$SignInResImpl.fromJson;

  @override
  String get jwt;
  @override
  UserEntity get user;
  @override
  @JsonKey(ignore: true)
  _$$SignInResImplCopyWith<_$SignInResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
