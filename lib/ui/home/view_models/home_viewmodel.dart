
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:image_flutter_isar/data/repositories/user_image_repository.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/utils/result.dart';
import 'dart:developer' as dev;

import 'package:image_picker/image_picker.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required UserImageRepository userImagesRepository})
    : _imagesRepository = userImagesRepository {
      load = Command.createAsyncNoParam(_load, initialValue: Result.success([]))..execute();
      pickImage = Command.createAsync(_pickImageToUpload, initialValue: Result.success(null));
    }

  final UserImageRepository _imagesRepository;
  final ImagePicker _picker = ImagePicker();
  
  // late Command0 load;
  late Command<void, Result<List<UserImage>>> load;
  late Command<ImageSource, Result<UserImage?>>  pickImage;

  List<UserImage> _userImages = [];
  List<UserImage> get userImages => _userImages;
  
  // File? _pickedImage;
  // File? get pickedImage => _pickedImage;

  Future<Result<List<UserImage>>> _load() async {
    try {
      final result = await _imagesRepository.getImagesList();
      if (result is Ok<List<UserImage>>) {
        _userImages = result.value;
      }
      dev.log("_load executed from ViewModel");
      return result;
    } on Exception catch (error) {
      return Result.failure(error);
    } finally {
      notifyListeners();
    }
  }
  
  Future<Result<UserImage?>> _pickImageToUpload(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        dev.log('Picked Image in VM is not null');
        return Result.success(UserImage(
          dateCreated: DateTime.now(),
          dateModified: DateTime.now(),
          title: "",
          hasSync: false,
          imagePath: pickedFile.path,
          location: ""
        ));
      } else {
        dev.log('Picked Image in VM is null');
        return Result.success(null);
      }
    } on Exception catch (error) {
      return Result.failure(error);
    } finally {
      notifyListeners();
    }
  }
}
