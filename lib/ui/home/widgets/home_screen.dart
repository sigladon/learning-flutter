
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/routing/routes.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:image_flutter_isar/utils/result.dart';

import 'dart:developer' as dev;

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[UploadOptionsMenu(viewModel: widget.viewModel)],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            dev.log("Checking if its running");
            if (widget.viewModel.load.isExecuting.value) {
              dev.log("It's RUNNING");
              return const Center(child: CircularProgressIndicator());
            }
            // if (widget.viewModel.load.) {
            //   return Text("Error");
            // }

            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverList.builder(
                      itemCount: widget.viewModel.userImages.length,
                      itemBuilder: (_, index) {
                        dev.log("Rendering Isar entries");
                        return Column(
                          children: [
                            Text(widget.viewModel.userImages[index].title),

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.file(
                                File(widget.viewModel.userImages[index].imagePath),
                                height: 400,
                                cacheHeight: 1080,
                                scale: 2.0,
                                fit: BoxFit.fitWidth,
                                key: ValueKey(
                                  widget.viewModel.userImages[index].imagePath,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class UploadOptionsMenu extends StatefulWidget {
  const UploadOptionsMenu({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  State<UploadOptionsMenu> createState() => _UploadOptionsMenuState();
}

class _UploadOptionsMenuState extends State<UploadOptionsMenu> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 4),
          child: MenuItemButton(
            onPressed: () {
              _selectMedia(context, ImageSource.gallery);
            },
            leadingIcon: const Icon(Icons.photo_library),
            child: const Text('Gallery'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 4),
          child: MenuItemButton(
            onPressed: () {
              _selectMedia(context, ImageSource.camera);
            },
            leadingIcon: const Icon(Icons.camera_alt),
            child: const Text('Camera'),
          ),
        ),
      ],
      builder: (_, MenuController controller, Widget? child) {
        return TextButton.icon(
          iconAlignment: IconAlignment.start,
          label: Text('New'),
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }

  void _selectMedia(BuildContext context, ImageSource source) async {
    dev.log('Executing pickImageCommand for source: $source');
    Result<UserImage?> result = await widget.viewModel.pickImage.executeWithFuture(source);
    if (result is Ok<UserImage?> && context.mounted && result.value != null) {
      dev.log('showing upload screen with ${result.value} image');
      context.push(routeUpload, extra: result.value);
    } else {
      dev.log('staying in Home Screen');
    }
  }
}
