import 'package:image_flutter_isar/data/repositories/user_image_repository.dart';
import 'package:image_flutter_isar/data/services/isar/isar_client.dart';
import 'package:image_flutter_isar/ui/home/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (_) => IsarClient()),
    Provider<UserImageRepository>(
      create: (context) => UserImageRepository(isarClient: context.read()),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(userImagesRepository: context.read<UserImageRepository>()),
    )
  ];
}