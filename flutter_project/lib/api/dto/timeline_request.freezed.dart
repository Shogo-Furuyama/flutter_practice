// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimelineRequest _$TimelineRequestFromJson(Map<String, dynamic> json) {
  return _TimelineRequest.fromJson(json);
}

/// @nodoc
mixin _$TimelineRequest {
  String? get i => throw _privateConstructorUsedError;
  @JsonKey(name: 'sinceId', disallowNullValue: true)
  String? get sinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'untilId', disallowNullValue: true)
  String? get untilId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineRequestCopyWith<TimelineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineRequestCopyWith<$Res> {
  factory $TimelineRequestCopyWith(
          TimelineRequest value, $Res Function(TimelineRequest) then) =
      _$TimelineRequestCopyWithImpl<$Res, TimelineRequest>;
  @useResult
  $Res call(
      {String? i,
      @JsonKey(name: 'sinceId', disallowNullValue: true) String? sinceId,
      @JsonKey(name: 'untilId', disallowNullValue: true) String? untilId});
}

/// @nodoc
class _$TimelineRequestCopyWithImpl<$Res, $Val extends TimelineRequest>
    implements $TimelineRequestCopyWith<$Res> {
  _$TimelineRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? i = freezed,
    Object? sinceId = freezed,
    Object? untilId = freezed,
  }) {
    return _then(_value.copyWith(
      i: freezed == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as String?,
      sinceId: freezed == sinceId
          ? _value.sinceId
          : sinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      untilId: freezed == untilId
          ? _value.untilId
          : untilId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineRequestImplCopyWith<$Res>
    implements $TimelineRequestCopyWith<$Res> {
  factory _$$TimelineRequestImplCopyWith(_$TimelineRequestImpl value,
          $Res Function(_$TimelineRequestImpl) then) =
      __$$TimelineRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? i,
      @JsonKey(name: 'sinceId', disallowNullValue: true) String? sinceId,
      @JsonKey(name: 'untilId', disallowNullValue: true) String? untilId});
}

/// @nodoc
class __$$TimelineRequestImplCopyWithImpl<$Res>
    extends _$TimelineRequestCopyWithImpl<$Res, _$TimelineRequestImpl>
    implements _$$TimelineRequestImplCopyWith<$Res> {
  __$$TimelineRequestImplCopyWithImpl(
      _$TimelineRequestImpl _value, $Res Function(_$TimelineRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? i = freezed,
    Object? sinceId = freezed,
    Object? untilId = freezed,
  }) {
    return _then(_$TimelineRequestImpl(
      i: freezed == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as String?,
      sinceId: freezed == sinceId
          ? _value.sinceId
          : sinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      untilId: freezed == untilId
          ? _value.untilId
          : untilId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineRequestImpl implements _TimelineRequest {
  _$TimelineRequestImpl(
      {required this.i,
      @JsonKey(name: 'sinceId', disallowNullValue: true) this.sinceId,
      @JsonKey(name: 'untilId', disallowNullValue: true) this.untilId});

  factory _$TimelineRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineRequestImplFromJson(json);

  @override
  final String? i;
  @override
  @JsonKey(name: 'sinceId', disallowNullValue: true)
  final String? sinceId;
  @override
  @JsonKey(name: 'untilId', disallowNullValue: true)
  final String? untilId;

  @override
  String toString() {
    return 'TimelineRequest(i: $i, sinceId: $sinceId, untilId: $untilId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineRequestImpl &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.sinceId, sinceId) || other.sinceId == sinceId) &&
            (identical(other.untilId, untilId) || other.untilId == untilId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, i, sinceId, untilId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineRequestImplCopyWith<_$TimelineRequestImpl> get copyWith =>
      __$$TimelineRequestImplCopyWithImpl<_$TimelineRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineRequestImplToJson(
      this,
    );
  }
}

abstract class _TimelineRequest implements TimelineRequest {
  factory _TimelineRequest(
      {required final String? i,
      @JsonKey(name: 'sinceId', disallowNullValue: true) final String? sinceId,
      @JsonKey(name: 'untilId', disallowNullValue: true)
      final String? untilId}) = _$TimelineRequestImpl;

  factory _TimelineRequest.fromJson(Map<String, dynamic> json) =
      _$TimelineRequestImpl.fromJson;

  @override
  String? get i;
  @override
  @JsonKey(name: 'sinceId', disallowNullValue: true)
  String? get sinceId;
  @override
  @JsonKey(name: 'untilId', disallowNullValue: true)
  String? get untilId;
  @override
  @JsonKey(ignore: true)
  _$$TimelineRequestImplCopyWith<_$TimelineRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
