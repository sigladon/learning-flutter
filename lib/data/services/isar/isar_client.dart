import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:image_flutter_isar/data/services/isar/models/isar_user_image.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as dev;
import 'package:path/path.dart' as p;

class IsarClient {
  Isar? _isar;
  final Completer<void> _initializationCompleter = Completer<void>();

  IsarClient() {
    dev.log('Initializing Isar');
    _init();
  }

  Future<void> _init() async {
    try {
      final dir = await getApplicationSupportDirectory();
      _isar = await Isar.open([IsarUserImageSchema], directory: dir.path);
      dev.log('Isar initialized');
      _initializationCompleter.complete();
    } catch (error) {
      developer.log('Error al abrir Isar: $error');
      _initializationCompleter.completeError(error);
    }
  }

  Future<Result<List<UserImage>>> getImages() async {
    await _initializationCompleter.future;
    if (_isar == null) {
      dev.log('Isar is not initializated');
      return Result.failure(Exception("Isar is not initializated"));
    }
    try {
      final images = await _isar!.isarUserImages.where().findAll();
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
    if (_isar == null) {
      return Result.failure(Exception("Isar is not initializated"));
    }
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final newFileName = p.basename(image.imagePath);
      final newPath = p.join(appDocDir.path, newFileName);

      // Copiar la imagen al directorio persistente
      final copiedImage = await File(image.imagePath).copy(newPath);
      final newImage = IsarUserImage()
          ..imagePath = copiedImage.path
          ..createdTime = image.dateCreated
          ..modifiedTime = image.dateModified
          ..hasSync = image.hasSync
          ..title = image.title
          ..location = image.location;
      await _isar!.writeTxn(() async {
        await _isar!.isarUserImages.put(newImage);
      });
      return Result.success(null);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }

   Future<Result<void>> deleteImage(int id) async {
    if (_isar == null) {
      return Result.failure(Exception("Isar is not initializated"));
    }
    try {
      await _isar!.isarUserImages.delete(id);
      return Result.success(null);
    } on Exception catch (error) {
      return Result.failure(error);
    }
   } 
}
