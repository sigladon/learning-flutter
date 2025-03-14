import 'dart:developer' as developer;

import 'package:image_flutter_isar/data/services/isar/models/isar_user_image.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarClient {
  late final Isar _isar;

  IsarClient() {
    _init();
  }

  Future<void> _init() async {
    try {
      final dir = await getApplicationSupportDirectory();
      _isar = await Isar.open([IsarUserImageSchema], directory: dir.path);
    } catch (e) {
      developer.log('Error al abrir Isar: $e');
    }
  }

  Future<Result<List<UserImage>>> getImages() async {
    try {
      final images = await _isar.isarUserImages.where().findAll();
      return Result.success(
        images.map(
          (image) => UserImage(
            imagePath: image.imagePath,
            dateCreated: image.createdTime,
            dateModified: image.modifiedTime,
            title: image.title,
            location: image.location,
            hasSync: image.hasSync
          ),
        ).toList(),
      );
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }

  Future<Result<void>> storeImage(UserImage image) async {
    try {
      final newImage = IsarUserImage()
          ..imagePath = image.imagePath
          ..createdTime = image.dateCreated
          ..modifiedTime = image.dateModified
          ..hasSync = image.hasSync
          ..title = image.title
          ..location = image.location;
      await _isar.writeTxn(() async {
        await _isar.isarUserImages.put(newImage);
      });
      return Result.success(null);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }

   Future<Result<void>> deleteImage(int id) async {
    try {
      await _isar.isarUserImages.delete(id);
      return Result.success(null);
    } on Exception catch (error) {
      return Result.failure(error);
    }
   } 
}
