// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) {
  return _SignUpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRequestModelCopyWith<SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelCopyWith(
          SignUpRequestModel value, $Res Function(SignUpRequestModel) then) =
      _$SignUpRequestModelCopyWithImpl<$Res, SignUpRequestModel>;
  @useResult
  $Res call(
      {String name,
      String surname,
      String address,
      String phoneNumber,
      String email,
      String password});
}

/// @nodoc
class _$SignUpRequestModelCopyWithImpl<$Res, $Val extends SignUpRequestModel>
    implements $SignUpRequestModelCopyWith<$Res> {
  _$SignUpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? surname = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRequestModelImplCopyWith<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  factory _$$SignUpRequestModelImplCopyWith(_$SignUpRequestModelImpl value,
          $Res Function(_$SignUpRequestModelImpl) then) =
      __$$SignUpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String surname,
      String address,
      String phoneNumber,
      String email,
      String password});
}

/// @nodoc
class __$$SignUpRequestModelImplCopyWithImpl<$Res>
    extends _$SignUpRequestModelCopyWithImpl<$Res, _$SignUpRequestModelImpl>
    implements _$$SignUpRequestModelImplCopyWith<$Res> {
  __$$SignUpRequestModelImplCopyWithImpl(_$SignUpRequestModelImpl _value,
      $Res Function(_$SignUpRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? surname = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpRequestModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRequestModelImpl implements _SignUpRequestModel {
  const _$SignUpRequestModelImpl(
      {required this.name,
      required this.surname,
      required this.address,
      required this.phoneNumber,
      required this.email,
      required this.password});

  factory _$SignUpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  final String surname;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpRequestModel(name: $name, surname: $surname, address: $address, phoneNumber: $phoneNumber, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, surname, address, phoneNumber, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestModelImplCopyWith<_$SignUpRequestModelImpl> get copyWith =>
      __$$SignUpRequestModelImplCopyWithImpl<_$SignUpRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequestModel implements SignUpRequestModel {
  const factory _SignUpRequestModel(
      {required final String name,
      required final String surname,
      required final String address,
      required final String phoneNumber,
      required final String email,
      required final String password}) = _$SignUpRequestModelImpl;

  factory _SignUpRequestModel.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  String get surname;
  @override
  String get address;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignUpRequestModelImplCopyWith<_$SignUpRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
