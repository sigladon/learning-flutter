import 'package:flutter/material.dart';
import 'package:image_flutter_isar/config/dependencies.dart';
import 'package:image_flutter_isar/routing/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'ui/theme.dart';


Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router(context.read()),
      debugShowCheckedModeBanner: false,
      title: 'Image management with Isar',
      theme: AppTheme.theme,
    );
  }
}

