import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:image_flutter_isar/collections/image_isar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {

  final url = Uri.parse(dotenv.env['API_URL']!);
  late int imageId;
  
  Future<bool> uploadImage(ImageIsar image) async {
    try {
      final request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
        'files',
        image.imagePath)
        );
      final response = await request.send();
      
      if (response.statusCode == 201) {
        developer.log('Image uploaded to server');
        return true;
      } else {
        developer.log('Error ${response.statusCode} while uploading image');
        return false;
      }
    } catch(e) {
      return false;
    }

    
  }
  
  
}