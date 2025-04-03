import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:image_flutter_isar/ui/upload/view_models/upload_viewmodel.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({
    super.key,
    required this.title,
    required this.viewModel,
    // required this.imageFile,
  });

  final String title;
  final UploadViewmodel viewModel;
  // final File imageFile;

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late TextEditingController _titleController;
  late TextEditingController _locationController;
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.viewModel.selectedImage.title);
    _locationController = TextEditingController(text: widget.viewModel.selectedImage.location);
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope<bool>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(widget.title);
          title: Text(
            widget.viewModel.selectedImage.title == ""
                ? 'Adding a post'
                : 'Modifiyng a post',
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(File(widget.viewModel.selectedImage.imagePath)),
                  TextFormField(
                    controller: _titleController,
                    decoration: _uploadFormInputDecoration('Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter a title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: _uploadFormInputDecoration('Location'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter a location';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          final imageToUpload = widget.viewModel.selectedImage.setTitle(_titleController.text).setLocation(_locationController.text);
                          widget.viewModel.upload.executeWithFuture(imageToUpload).then((_) {
                            if (context.mounted) {
                              Provider.of<HomeViewModel>(context, listen: false).load.execute();
                            context.pop();
                            }
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Upload'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _uploadFormInputDecoration(String label) {
    return InputDecoration(
      border: UnderlineInputBorder(),
      label: Text(label),
      labelStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
    );
  }
  Future<bool> _onWillPop() async {
    final modifiedImage = widget.viewModel.selectedImage.setLocation(_locationController.text).setTitle(_titleController.text);
    if (widget.viewModel.selectedImage.title == "" || widget.viewModel.selectedImage != modifiedImage) {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Discard changes?'),
              content: const Text('You have unsaved changes. Are you sure you want to discard them?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => context.pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }
    return true;
  }
}
