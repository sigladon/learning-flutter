
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_flutter_isar/data/repositories/user_image_repository.dart';
import 'package:image_flutter_isar/domain/models/user_image/user_image.dart';
import 'package:image_flutter_isar/routing/routes.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:image_flutter_isar/ui/home/widgets/home_screen.dart';
import 'package:image_flutter_isar/ui/upload/view_models/upload_viewmodel.dart';
import 'package:image_flutter_isar/ui/upload/widgets/upload_screen.dart';

GoRouter router(UserImageRepository repository) => GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: routeHome,
      builder: (BuildContext context, GoRouterState state) {
        final viewModel = HomeViewModel(
          userImagesRepository: repository,
        );
        return HomeScreen(title: 'User Uploads', viewModel: viewModel);
      },
    ),
    GoRoute(
      path: routeUpload,
      builder: (context, state) {
        final UserImage imageFile = state.extra as UserImage;
        final viewModel = UploadViewmodel(userImageRepository: repository, imageUser: imageFile);
        return UploadScreen(title: "Upload", viewModel: viewModel);
      },
    )
  ],
);