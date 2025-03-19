// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserImage _$UserImageFromJson(Map<String, dynamic> json) {
  return _UserImage.fromJson(json);
}

/// @nodoc
mixin _$UserImage {
  String get imagePath => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;
  DateTime get dateModified => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool get hasSync => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserImageCopyWith<UserImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserImageCopyWith<$Res> {
  factory $UserImageCopyWith(UserImage value, $Res Function(UserImage) then) =
      _$UserImageCopyWithImpl<$Res, UserImage>;
  @useResult
  $Res call(
      {String imagePath,
      DateTime dateCreated,
      DateTime dateModified,
      String title,
      String location,
      bool hasSync});
}

/// @nodoc
class _$UserImageCopyWithImpl<$Res, $Val extends UserImage>
    implements $UserImageCopyWith<$Res> {
  _$UserImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? dateCreated = null,
    Object? dateModified = null,
    Object? title = null,
    Object? location = null,
    Object? hasSync = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      hasSync: null == hasSync
          ? _value.hasSync
          : hasSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImageImplCopyWith<$Res>
    implements $UserImageCopyWith<$Res> {
  factory _$$UserImageImplCopyWith(
          _$UserImageImpl value, $Res Function(_$UserImageImpl) then) =
      __$$UserImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath,
      DateTime dateCreated,
      DateTime dateModified,
      String title,
      String location,
      bool hasSync});
}

/// @nodoc
class __$$UserImageImplCopyWithImpl<$Res>
    extends _$UserImageCopyWithImpl<$Res, _$UserImageImpl>
    implements _$$UserImageImplCopyWith<$Res> {
  __$$UserImageImplCopyWithImpl(
      _$UserImageImpl _value, $Res Function(_$UserImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? dateCreated = null,
    Object? dateModified = null,
    Object? title = null,
    Object? location = null,
    Object? hasSync = null,
  }) {
    return _then(_$UserImageImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      hasSync: null == hasSync
          ? _value.hasSync
          : hasSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImageImpl extends _UserImage {
  const _$UserImageImpl(
      {required this.imagePath,
      required this.dateCreated,
      required this.dateModified,
      required this.title,
      required this.location,
      required this.hasSync})
      : super._();

  factory _$UserImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImageImplFromJson(json);

  @override
  final String imagePath;
  @override
  final DateTime dateCreated;
  @override
  final DateTime dateModified;
  @override
  final String title;
  @override
  final String location;
  @override
  final bool hasSync;

  @override
  String toString() {
    return 'UserImage(imagePath: $imagePath, dateCreated: $dateCreated, dateModified: $dateModified, title: $title, location: $location, hasSync: $hasSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImageImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.hasSync, hasSync) || other.hasSync == hasSync));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imagePath, dateCreated,
      dateModified, title, location, hasSync);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImageImplCopyWith<_$UserImageImpl> get copyWith =>
      __$$UserImageImplCopyWithImpl<_$UserImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImageImplToJson(
      this,
    );
  }
}

abstract class _UserImage extends UserImage {
  const factory _UserImage(
      {required final String imagePath,
      required final DateTime dateCreated,
      required final DateTime dateModified,
      required final String title,
      required final String location,
      required final bool hasSync}) = _$UserImageImpl;
  const _UserImage._() : super._();

  factory _UserImage.fromJson(Map<String, dynamic> json) =
      _$UserImageImpl.fromJson;

  @override
  String get imagePath;
  @override
  DateTime get dateCreated;
  @override
  DateTime get dateModified;
  @override
  String get title;
  @override
  String get location;
  @override
  bool get hasSync;
  @override
  @JsonKey(ignore: true)
  _$$UserImageImplCopyWith<_$UserImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
