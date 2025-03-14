import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_flutter_isar/routing/routes.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:image_flutter_isar/ui/home/widgets/home_screen.dart';
import 'package:image_flutter_isar/ui/upload/upload.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: routeHome,
      builder: (BuildContext context, GoRouterState state) {
        final viewModel = HomeViewModel(
          userImagesRepository: context.read(),
        );
        return HomeScreen(title: 'Feed', viewModel: viewModel);
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: routeUpload,
      //     builder: (context, state) {
      //       return UploadPage(selectedImage: selectedImage);
      //     },
      //   )
      // ]
    )
  ]
);