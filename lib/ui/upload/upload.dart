
// import 'package:flutter/material.dart';

// class UploadPage extends StatefulWidget {
//   final String selectedImage;
//   const UploadPage({super.key, required this.selectedImage, });

//   @override
//   State<UploadPage> createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {

//   // bool _isUploading = false;
//   // String? _selectedImage;
//   // final _dbService = IsarClient();
  
//   @override
//   void initState() {
//     super.initState();
//     // _selectedImage = widget.selectedImage;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     );
//   }

//   // PreferredSizeWidget _buildAppBar() {
//   //   return AppBar(title: const Text('Upload an image'));
//   // }

//   InputDecoration _uploadFormInputDecoration(String label) {
//     return InputDecoration(
//       border: UnderlineInputBorder(),
//       label: Text(label),
//       labelStyle: TextStyle(
//         fontSize: 20,
//         fontStyle: FontStyle.italic
//       )
//     );
//   }

//   // Future<void> _uploadImageIsar() async {
//   //   setState(() {
//   //     _isUploading = true;
//   //   });
//   //   await  _dbService.storeImage(_selectedImage!);
//   //   setState(() {
//   //     _isUploading = false;
//   //   });
//   //   if(mounted) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Saving Image'))
//   //     );
//   //     Navigator.pop(context, true);
//   //     await _dbService.uploadToServer();
//   //   }
//   // }
// }