// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImageImpl _$$UserImageImplFromJson(Map<String, dynamic> json) =>
    _$UserImageImpl(
      imagePath: json['imagePath'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
      title: json['title'] as String,
      location: json['location'] as String,
      hasSync: json['hasSync'] as bool,
    );

Map<String, dynamic> _$$UserImageImplToJson(_$UserImageImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateModified': instance.dateModified.toIso8601String(),
      'title': instance.title,
      'location': instance.location,
      'hasSync': instance.hasSync,
    };
