import 'package:flutter/material.dart';
import 'package:image_flutter_isar/pages/home.dart';
import 'package:image_flutter_isar/pages/upload.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'routes.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image management with Isar',
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
      ),
      onGenerateRoute: (settings) {
        final Widget page;
        if (settings.name == routeHome) {
          page = MyHomePage(title: 'Image Managment with Isar',);
        } else if (settings.name == routeUpload) {
          final args = settings.arguments as String?;
          if (args != null) {
            page = UploadPage(
              selectedImage: args,
            );
          } else {
            page = MyHomePage(title: 'Image Managment with Isar',); 
          }
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          }
        );
      },
    );
  }
}

