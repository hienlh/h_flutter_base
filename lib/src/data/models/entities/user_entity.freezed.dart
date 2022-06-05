// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String? get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get isExternal => throw _privateConstructorUsedError;
  bool? get hasPassword => throw _privateConstructorUsedError;
  String? get concurrencyStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
  $Res call(
      {String? userName,
      String email,
      String? name,
      String? surname,
      String? phoneNumber,
      bool? isExternal,
      bool? hasPassword,
      String? concurrencyStamp});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? phoneNumber = freezed,
    Object? isExternal = freezed,
    Object? hasPassword = freezed,
    Object? concurrencyStamp = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isExternal: isExternal == freezed
          ? _value.isExternal
          : isExternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPassword: hasPassword == freezed
          ? _value.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      concurrencyStamp: concurrencyStamp == freezed
          ? _value.concurrencyStamp
          : concurrencyStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserEntityCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$_UserEntityCopyWith(
          _$_UserEntity value, $Res Function(_$_UserEntity) then) =
      __$$_UserEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userName,
      String email,
      String? name,
      String? surname,
      String? phoneNumber,
      bool? isExternal,
      bool? hasPassword,
      String? concurrencyStamp});
}

/// @nodoc
class __$$_UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$$_UserEntityCopyWith<$Res> {
  __$$_UserEntityCopyWithImpl(
      _$_UserEntity _value, $Res Function(_$_UserEntity) _then)
      : super(_value, (v) => _then(v as _$_UserEntity));

  @override
  _$_UserEntity get _value => super._value as _$_UserEntity;

  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? phoneNumber = freezed,
    Object? isExternal = freezed,
    Object? hasPassword = freezed,
    Object? concurrencyStamp = freezed,
  }) {
    return _then(_$_UserEntity(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isExternal: isExternal == freezed
          ? _value.isExternal
          : isExternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPassword: hasPassword == freezed
          ? _value.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      concurrencyStamp: concurrencyStamp == freezed
          ? _value.concurrencyStamp
          : concurrencyStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEntity with DiagnosticableTreeMixin implements _UserEntity {
  const _$_UserEntity(
      {this.userName,
      required this.email,
      this.name,
      this.surname,
      this.phoneNumber,
      this.isExternal,
      this.hasPassword,
      this.concurrencyStamp});

  factory _$_UserEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityFromJson(json);

  @override
  final String? userName;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? phoneNumber;
  @override
  final bool? isExternal;
  @override
  final bool? hasPassword;
  @override
  final String? concurrencyStamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEntity(userName: $userName, email: $email, name: $name, surname: $surname, phoneNumber: $phoneNumber, isExternal: $isExternal, hasPassword: $hasPassword, concurrencyStamp: $concurrencyStamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntity'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('surname', surname))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('isExternal', isExternal))
      ..add(DiagnosticsProperty('hasPassword', hasPassword))
      ..add(DiagnosticsProperty('concurrencyStamp', concurrencyStamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntity &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.isExternal, isExternal) &&
            const DeepCollectionEquality()
                .equals(other.hasPassword, hasPassword) &&
            const DeepCollectionEquality()
                .equals(other.concurrencyStamp, concurrencyStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(isExternal),
      const DeepCollectionEquality().hash(hasPassword),
      const DeepCollectionEquality().hash(concurrencyStamp));

  @JsonKey(ignore: true)
  @override
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      __$$_UserEntityCopyWithImpl<_$_UserEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityToJson(this);
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {final String? userName,
      required final String email,
      final String? name,
      final String? surname,
      final String? phoneNumber,
      final bool? isExternal,
      final bool? hasPassword,
      final String? concurrencyStamp}) = _$_UserEntity;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$_UserEntity.fromJson;

  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get surname => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  bool? get isExternal => throw _privateConstructorUsedError;
  @override
  bool? get hasPassword => throw _privateConstructorUsedError;
  @override
  String? get concurrencyStamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
