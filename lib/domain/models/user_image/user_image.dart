import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_image.freezed.dart';
part 'user_image.g.dart';

@freezed
abstract class UserImage with _$UserImage {
  const UserImage._();

  const factory UserImage({
    required String imagePath,
    required DateTime dateCreated,
    required DateTime dateModified,
    required String title,
    required String location,
    required bool hasSync,
  }) = _UserImage;
  
  factory UserImage.fromJson(Map<String, Object?> json) => _$UserImageFromJson(json);
  
  UserImage setTitle(String newTitle) {
    return copyWith(title: newTitle);
  }

  UserImage setLocation(String newLocation) {
    return copyWith(location: newLocation);
  }

  UserImage setDateModified(DateTime newDateModified) {
    return copyWith(dateModified: newDateModified);
  }

  UserImage setHasSync(bool newHasSync) {
    return copyWith(hasSync: newHasSync);
  }
  
}