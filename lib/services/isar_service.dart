
import 'dart:developer' as developer;
import 'dart:io';

import 'package:image_flutter_isar/collections/image_isar.dart';
import 'package:image_flutter_isar/services/http_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class IsarService {
  late Future<Isar> _isar;
  HttpService http = HttpService();
  static final IsarService _instance = IsarService._internal();
  
  factory IsarService() {
    return _instance;
  }
  
  IsarService._internal() {
    _isar = _openDB();
  }
  
  static Future<Isar> _openDB() async {
    final dir = await getApplicationSupportDirectory();
    return Isar.open([ImageIsarSchema], directory: dir.path);
  }

  Future<List<String>> getImages() async {
    Isar db = await _isar;
    final images = await db.imageIsars.where().sortByCreatedTimeDesc().findAll();
    return images.map((image) => image.imagePath).toList();
  }

  Future<void> storeImage(String imagePath) async {
    Isar db = await _isar;
    final existingImage = await db.imageIsars.filter()
      .imagePathEqualTo(imagePath)
      .findFirst();

    if (existingImage != null ) return;
    
    final documentsDirectory = await getApplicationDocumentsDirectory();

    // Crear un nombre de archivo único
    final fileName = path.basename(imagePath); // Obtiene el nombre del archivo original
    final newImagePath = '${documentsDirectory.path}/$fileName';

    // Copiar la imagen al directorio de documentos
    final imageFile = File(imagePath);
    await imageFile.copy(newImagePath);

    final image = ImageIsar()
      ..createdTime = DateTime.now()
      ..imagePath = newImagePath
      ..hasSync = false;
    
    await db.writeTxn(() async {
      await db.imageIsars.put(image);
    });
    

  }
  
  Future<void> uploadToServer() async {
    Isar db = await _isar;
    final pendingImages = await db.imageIsars.filter()
      .hasSyncEqualTo(false)
      .findAll();
      
    if (pendingImages.isEmpty) return;

    await Future.wait(pendingImages.map((image) async {
      developer.log('Cargando imagen: ${image.imagePath}');
      bool uploadState = await http.uploadImage(image); 
      await db.writeTxn(() async {
        image.hasSync = uploadState;
        await db.imageIsars.put(image);
      });
    }));
    
  }

}