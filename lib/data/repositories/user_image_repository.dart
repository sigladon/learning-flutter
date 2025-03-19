
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';
import 'dart:developer' as dev;

class UserImageRepository {
  UserImageRepository({ required IsarClient isarClient })
    : _isarClient = isarClient;
    
  final IsarClient _isarClient;
    
  List<UserImage> _cachedData = [];

  Future<Result<List<UserImage>>> getImagesList() async {
    if (_cachedData.isEmpty) {
      final result = await _isarClient.getImages();
      dev.log("Loading from isar");
      if (result is Ok<List<UserImage>>) {
        _cachedData = result.value;
      }
      return result;
    } else {
      dev.log("Loading from cache");
      return Result.success(_cachedData);
    }
  }

  // Future<Result<UserImage>> getImage(int id);
  
  Future<Result<void>> uploadImage(UserImage image) async {
    try {
      final result = await _isarClient.storeImage(image);
      return result;
    } on Exception catch (error) {
    return Result.failure(error);
    }
  }

  // Future<Result<void>> deleteImage(int id);

}