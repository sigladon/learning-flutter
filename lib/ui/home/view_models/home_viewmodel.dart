import 'package:flutter/material.dart';
import 'package:image_flutter_isar/data/repositories/user_image_repository.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required UserImageRepository userImagesRepository})
    : _imagesRepository = userImagesRepository;

  final UserImageRepository _imagesRepository;

  List<UserImage> _userImages = [];
  List<UserImage> get userImages => _userImages;

  Future<Result> _load() async {
    try {
      final result = await _imagesRepository.getImagesList();
      return Result.success(result);
    } on Exception catch (error) {
      return Result.failure(error);
    } finally {
      notifyListeners();
    }
  }
}
