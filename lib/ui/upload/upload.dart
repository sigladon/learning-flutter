import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';

class UploadPage extends StatefulWidget {
  final String selectedImage;
  const UploadPage({super.key, required this.selectedImage, });

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  // bool _isUploading = false;
  // final _formKey = GlobalKey<FormState>();
  // String? _selectedImage;
  // final _dbService = IsarClient();
  
  @override
  void initState() {
    super.initState();
    // _selectedImage = widget.selectedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: _buildAppBar(),
    //   body: Form(
    //   key: _formKey,
    //   child: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20),
    //       child: Column(
    //         spacing: 20,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           _selectedImage != ""
    //           ? Image.file(File(_selectedImage!))
    //           : Text('Error al cargar la imágen'),
    //           TextFormField(
    //             decoration: _uploadFormInputDecoration('Name'),
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please, enter a title';
    //               }
    //               return null;
    //             },
    //           ),
    //           TextFormField(
    //             decoration: _uploadFormInputDecoration('Location'),
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please, enter a title';
    //               }
    //               return null;
    //             },
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 16),
    //             child: ElevatedButton(
    //               onPressed: _isUploading ? null :  () async {
    //                 if (_formKey.currentState!.validate()) {
    //                   await _uploadImageIsar();
    //                   if (context.mounted) {
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       const SnackBar(content: Text('Saving Data')),
    //                     );
    //                   }
    //                 }
    //               },
    //               child: const Text('Upload'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    );
  }

  // PreferredSizeWidget _buildAppBar() {
  //   return AppBar(title: const Text('Upload an image'));
  // }

  // InputDecoration _uploadFormInputDecoration(String label) {
  //   return InputDecoration(
  //     border: UnderlineInputBorder(),
  //     label: Text(label),
  //     labelStyle: TextStyle(
  //       fontSize: 20,
  //       fontStyle: FontStyle.italic
  //     )
  //   );
  // }

  // Future<void> _uploadImageIsar() async {
  //   setState(() {
  //     _isUploading = true;
  //   });
  //   await  _dbService.storeImage(_selectedImage!);
  //   setState(() {
  //     _isUploading = false;
  //   });
  //   if(mounted) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Saving Image'))
  //     );
  //     Navigator.pop(context, true);
  //     await _dbService.uploadToServer();
  //   }
  // }
}