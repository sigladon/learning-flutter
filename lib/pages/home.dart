import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_flutter_isar/routes.dart';
import 'package:image_flutter_isar/services/isar_service.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  
  final String title;
  const MyHomePage({super.key, required this.title,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final isarService = IsarService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer? _timer;
  bool _isSyncing = false;
  
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (!_isSyncing) sync();
    });
  }
  
  void sync() async {
    setState(() {
      _isSyncing = true;
    });
    await isarService.uploadToServer(); // Llama a uploadToServer cada minuto
    setState(() {
      _isSyncing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      body: FutureBuilder<List<String>?>(
        future: _readImagesFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error appeared ${snapshot.error}");
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: snapshot.data!.length,
              itemBuilder:(context, index) {
                final imagePath = snapshot.data![index];
                final imageFile = File(imagePath);
                    
                if (imageFile.existsSync()) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.file(
                      imageFile,
                      height: 400,
                      cacheHeight: 1080,
                      scale: 2.0,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                } else {
                  // La imagen no existe, mostrar un placeholder o omitir
                  return null;
                }
              },
            );
          } else {
            return const Center(child: Text("No hay imágenes para mostrar"));
          }
        },
      ),
    );
  }


  Future<List<String>?> _readImagesFromDatabase() async {
    return isarService.getImages();
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Feed'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add_box),
          onPressed: () {
            _mostrarModalSeleccion(context);
          },
        ),
      ],
    );
  }

  Future<void> _mostrarModalSeleccion(BuildContext context) async {
    if (!context.mounted) return;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context); // Cierra el modal
                  _seleccionarImagen(context, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context); // Cierra el modal
                  _seleccionarImagen(context, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _seleccionarImagen(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && _scaffoldKey.currentState!.mounted) {
      final result = await Navigator.pushNamed(
        _scaffoldKey.currentState!.context,
        routeUpload, 
        arguments: pickedFile.path
      );
      if(result == true) {
        setState(() {
          
        });
      }
    } else if (pickedFile != null && !context.mounted) {
      developer.log('My HomePage no está montado');
    }
  }
}
