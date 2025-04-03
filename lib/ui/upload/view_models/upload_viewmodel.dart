
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:image_flutter_isar/data/repositories/user_image_repository.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';

class UploadViewmodel extends ChangeNotifier {
  UploadViewmodel({
    required UserImageRepository userImageRepository,
    required UserImage imageUser

    })
    : _imageRepository = userImageRepository,
    _selectedImage = imageUser 
    {
      upload = Command.createAsync(_upload, initialValue: Result.success(null));
    }

  final UserImage _selectedImage;
  UserImage get selectedImage => _selectedImage;
  final UserImageRepository _imageRepository;
  
  late Command<UserImage, Result<void>> upload;

  Future<Result<void>> _upload(UserImage image) async {
    try {
      final result = await _imageRepository.saveImageToUpload(image);
      return result;
    } on Exception catch (error) {
      return Result.failure(error);
    } finally {
      notifyListeners();
    }
  }
}
