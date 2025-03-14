
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';

class UserImageRepository {
  UserImageRepository({ required IsarClient isarClient })
    : _isarClient = isarClient;
    
  final IsarClient _isarClient;
    
  List<UserImage> _cachedData = [];

  Future<Result<List<UserImage>>> getImagesList() async {
    if (_cachedData.isEmpty) {
      final result = await _isarClient.getImages();
      if (result is Ok<List<UserImage>>) {
        _cachedData = result.value;
      }
      return result;
    } else {
      return Result.success(_cachedData);
    }
  }

  // Future<Result<UserImage>> getImage(int id);
  
  // Future<Result<void>> uploadImage(UserImage image);

  // Future<Result<void>> deleteImage(int id);

}