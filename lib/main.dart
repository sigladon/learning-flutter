import 'package:flutter/material.dart';
import 'package:image_flutter_isar/routing/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Image management with Isar',
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
      ),
      routerConfig: router,
    );
  }
}

