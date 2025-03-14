import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:image_flutter_isar/data/services/isar/models/isar_user_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_flutter_isar/utils/result.dart';

class ApiClient {
  final url = Uri.parse(dotenv.env['API_URL']!);

  Future<Result<void>> uploadImage(IsarUserImage image) async {
    try {
      final request = http.MultipartRequest('POST', url);
      request.files.add(
        await http.MultipartFile.fromPath('files', image.imagePath),
      );
      final response = await request.send();
      if (response.statusCode == 201) {
        developer.log('Error ${response.statusCode} while uploading image');
        return Result.success(null);
      }

      return Result.success(null);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }
}
