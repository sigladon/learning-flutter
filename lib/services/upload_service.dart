import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:image_flutter_isar/services/isar_service.dart';

class UploadService {
  
  final _isarService = IsarService();

  Future<void> startMonitoring() async {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) async {
        if (!result.contains(ConnectivityResult.none)) {
          await _isarService.uploadToServer();
        }
      }
    );
  }
  

}