// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_phone_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInPhoneEmailRes _$SignInPhoneEmailResFromJson(Map<String, dynamic> json) {
  return _SignInPhoneEmailRes.fromJson(json);
}

/// @nodoc
mixin _$SignInPhoneEmailRes {
  String? get emailOrPhone => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get expireAt => throw _privateConstructorUsedError;
  DateTime? get nextTimeAllowSendOtp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInPhoneEmailResCopyWith<SignInPhoneEmailRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneEmailResCopyWith<$Res> {
  factory $SignInPhoneEmailResCopyWith(
          SignInPhoneEmailRes value, $Res Function(SignInPhoneEmailRes) then) =
      _$SignInPhoneEmailResCopyWithImpl<$Res>;
  $Res call(
      {String? emailOrPhone,
      DateTime? createdAt,
      DateTime? expireAt,
      DateTime? nextTimeAllowSendOtp});
}

/// @nodoc
class _$SignInPhoneEmailResCopyWithImpl<$Res>
    implements $SignInPhoneEmailResCopyWith<$Res> {
  _$SignInPhoneEmailResCopyWithImpl(this._value, this._then);

  final SignInPhoneEmailRes _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneEmailRes) _then;

  @override
  $Res call({
    Object? emailOrPhone = freezed,
    Object? createdAt = freezed,
    Object? expireAt = freezed,
    Object? nextTimeAllowSendOtp = freezed,
  }) {
    return _then(_value.copyWith(
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireAt: expireAt == freezed
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextTimeAllowSendOtp: nextTimeAllowSendOtp == freezed
          ? _value.nextTimeAllowSendOtp
          : nextTimeAllowSendOtp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInPhoneEmailResCopyWith<$Res>
    implements $SignInPhoneEmailResCopyWith<$Res> {
  factory _$$_SignInPhoneEmailResCopyWith(_$_SignInPhoneEmailRes value,
          $Res Function(_$_SignInPhoneEmailRes) then) =
      __$$_SignInPhoneEmailResCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? emailOrPhone,
      DateTime? createdAt,
      DateTime? expireAt,
      DateTime? nextTimeAllowSendOtp});
}

/// @nodoc
class __$$_SignInPhoneEmailResCopyWithImpl<$Res>
    extends _$SignInPhoneEmailResCopyWithImpl<$Res>
    implements _$$_SignInPhoneEmailResCopyWith<$Res> {
  __$$_SignInPhoneEmailResCopyWithImpl(_$_SignInPhoneEmailRes _value,
      $Res Function(_$_SignInPhoneEmailRes) _then)
      : super(_value, (v) => _then(v as _$_SignInPhoneEmailRes));

  @override
  _$_SignInPhoneEmailRes get _value => super._value as _$_SignInPhoneEmailRes;

  @override
  $Res call({
    Object? emailOrPhone = freezed,
    Object? createdAt = freezed,
    Object? expireAt = freezed,
    Object? nextTimeAllowSendOtp = freezed,
  }) {
    return _then(_$_SignInPhoneEmailRes(
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireAt: expireAt == freezed
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextTimeAllowSendOtp: nextTimeAllowSendOtp == freezed
          ? _value.nextTimeAllowSendOtp
          : nextTimeAllowSendOtp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$_SignInPhoneEmailRes
    with DiagnosticableTreeMixin
    implements _SignInPhoneEmailRes {
  const _$_SignInPhoneEmailRes(
      {this.emailOrPhone,
      this.createdAt,
      this.expireAt,
      this.nextTimeAllowSendOtp});

  factory _$_SignInPhoneEmailRes.fromJson(Map<String, dynamic> json) =>
      _$$_SignInPhoneEmailResFromJson(json);

  @override
  final String? emailOrPhone;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? expireAt;
  @override
  final DateTime? nextTimeAllowSendOtp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInPhoneEmailRes(emailOrPhone: $emailOrPhone, createdAt: $createdAt, expireAt: $expireAt, nextTimeAllowSendOtp: $nextTimeAllowSendOtp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInPhoneEmailRes'))
      ..add(DiagnosticsProperty('emailOrPhone', emailOrPhone))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('expireAt', expireAt))
      ..add(DiagnosticsProperty('nextTimeAllowSendOtp', nextTimeAllowSendOtp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInPhoneEmailRes &&
            const DeepCollectionEquality()
                .equals(other.emailOrPhone, emailOrPhone) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.expireAt, expireAt) &&
            const DeepCollectionEquality()
                .equals(other.nextTimeAllowSendOtp, nextTimeAllowSendOtp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailOrPhone),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(expireAt),
      const DeepCollectionEquality().hash(nextTimeAllowSendOtp));

  @JsonKey(ignore: true)
  @override
  _$$_SignInPhoneEmailResCopyWith<_$_SignInPhoneEmailRes> get copyWith =>
      __$$_SignInPhoneEmailResCopyWithImpl<_$_SignInPhoneEmailRes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInPhoneEmailResToJson(this);
  }
}

abstract class _SignInPhoneEmailRes implements SignInPhoneEmailRes {
  const factory _SignInPhoneEmailRes(
      {final String? emailOrPhone,
      final DateTime? createdAt,
      final DateTime? expireAt,
      final DateTime? nextTimeAllowSendOtp}) = _$_SignInPhoneEmailRes;

  factory _SignInPhoneEmailRes.fromJson(Map<String, dynamic> json) =
      _$_SignInPhoneEmailRes.fromJson;

  @override
  String? get emailOrPhone => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime? get expireAt => throw _privateConstructorUsedError;
  @override
  DateTime? get nextTimeAllowSendOtp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInPhoneEmailResCopyWith<_$_SignInPhoneEmailRes> get copyWith =>
      throw _privateConstructorUsedError;
}
