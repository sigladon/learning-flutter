
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';
import 'dart:developer' as dev;

class UserImageRepository {
  UserImageRepository({ required IsarClient isarClient })
    : _isarClient = isarClient;
    
  final IsarClient _isarClient;
    

  Future<Result<List<UserImage>>> getImagesList() async {
    try {
      final result = await _isarClient.getImages();
      dev.log("Loading from isar");
      return result;
    } on Exception catch (error) {
      dev.log("Error loading from isar");
      return Result.failure(error);
    }
  }

  // Future<Result<UserImage>> getImage(int id);
  
  Future<Result<void>> saveImageToUpload(UserImage image) async {
    try {
      final result = await _isarClient.storeImage(image);
      return result;
    } on Exception catch (error) {
    return Result.failure(error);
    }
  }

  // Future<Result<void>> deleteImage(int id);

}