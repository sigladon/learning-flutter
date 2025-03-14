import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_flutter_isar/routing/routes.dart';
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.viewModel});

  final String title;
  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(context),
      // body: SafeArea(
      //   top: true,
      //   bottom: true,
      //   child: FutureBuilder<List<String>?>(
      //     future: _readImagesFromDatabase(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const CircularProgressIndicator();
      //       } else if (snapshot.hasError) {
      //         return Text("Error appeared ${snapshot.error}");
      //       } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      //         return ListView.builder(
      //           addAutomaticKeepAlives: false,
      //           itemCount: snapshot.data!.length,
      //           itemBuilder:(context, index) {
      //             final imagePath = snapshot.data![index];
      //             final imageFile = File(imagePath);
                      
      //             if (imageFile.existsSync()) {
      //               return Padding(
      //                 padding: const EdgeInsets.all(12),
      //                 child: Image.file(
      //                   imageFile,
      //                   height: 400,
      //                   cacheHeight: 1080,
      //                   scale: 2.0,
      //                   fit: BoxFit.fitWidth,
      //                 ),
      //               );
      //             } else {
      //               // La imagen no existe, mostrar un placeholder o omitir
      //               return null;
      //             }
      //           },
      //         );
      //       } else {
      //         return const Center(child: Text("No hay imágenes para mostrar"));
      //       }
      //     },
      //   ),
      // ),
    );
  }

  // Future<void> _mostrarModalSeleccion(BuildContext context) async {
  //   if (!context.mounted) return;
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: <Widget>[
  //             ListTile(
  //               leading: Icon(Icons.photo_library),
  //               title: Text('Gallery'),
  //               onTap: () {
  //                 Navigator.pop(context); // Cierra el modal
  //                 _seleccionarImagen(context, ImageSource.gallery);
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.camera_alt),
  //               title: Text('Camera'),
  //               onTap: () {
  //                 Navigator.pop(context); // Cierra el modal
  //                 _seleccionarImagen(context, ImageSource.camera);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<void> _seleccionarImagen(BuildContext context, ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);

  //   if (pickedFile != null) {
  //     final result = await Navigator.pushNamed(
  //       routeUpload, 
  //       arguments: pickedFile.path
  //     );
  //     if(result == true) {
  //       setState(() {
          
  //       });
  //     }
  //   } else if (pickedFile != null && !context.mounted) {
  //     developer.log('My HomePage no está montado');
  //   }
  // }
}
