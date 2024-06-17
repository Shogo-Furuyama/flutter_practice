// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckAuthResponse _$CheckAuthResponseFromJson(Map<String, dynamic> json) {
  return _CheckAuthResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckAuthResponse {
  bool get ok => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckAuthResponseCopyWith<CheckAuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckAuthResponseCopyWith<$Res> {
  factory $CheckAuthResponseCopyWith(
          CheckAuthResponse value, $Res Function(CheckAuthResponse) then) =
      _$CheckAuthResponseCopyWithImpl<$Res, CheckAuthResponse>;
  @useResult
  $Res call({bool ok, String? token});
}

/// @nodoc
class _$CheckAuthResponseCopyWithImpl<$Res, $Val extends CheckAuthResponse>
    implements $CheckAuthResponseCopyWith<$Res> {
  _$CheckAuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      ok: null == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckAuthResponseImplCopyWith<$Res>
    implements $CheckAuthResponseCopyWith<$Res> {
  factory _$$CheckAuthResponseImplCopyWith(_$CheckAuthResponseImpl value,
          $Res Function(_$CheckAuthResponseImpl) then) =
      __$$CheckAuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool ok, String? token});
}

/// @nodoc
class __$$CheckAuthResponseImplCopyWithImpl<$Res>
    extends _$CheckAuthResponseCopyWithImpl<$Res, _$CheckAuthResponseImpl>
    implements _$$CheckAuthResponseImplCopyWith<$Res> {
  __$$CheckAuthResponseImplCopyWithImpl(_$CheckAuthResponseImpl _value,
      $Res Function(_$CheckAuthResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? token = freezed,
  }) {
    return _then(_$CheckAuthResponseImpl(
      ok: null == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckAuthResponseImpl implements _CheckAuthResponse {
  _$CheckAuthResponseImpl({required this.ok, this.token});

  factory _$CheckAuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckAuthResponseImplFromJson(json);

  @override
  final bool ok;
  @override
  final String? token;

  @override
  String toString() {
    return 'CheckAuthResponse(ok: $ok, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthResponseImpl &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ok, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckAuthResponseImplCopyWith<_$CheckAuthResponseImpl> get copyWith =>
      __$$CheckAuthResponseImplCopyWithImpl<_$CheckAuthResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckAuthResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckAuthResponse implements CheckAuthResponse {
  factory _CheckAuthResponse({required final bool ok, final String? token}) =
      _$CheckAuthResponseImpl;

  factory _CheckAuthResponse.fromJson(Map<String, dynamic> json) =
      _$CheckAuthResponseImpl.fromJson;

  @override
  bool get ok;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$CheckAuthResponseImplCopyWith<_$CheckAuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
