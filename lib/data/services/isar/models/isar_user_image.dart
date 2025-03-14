import 'package:isar/isar.dart';

part 'isar_user_image.g.dart';

@collection
class IsarUserImage {
  Id id = Isar.autoIncrement;
  late String imagePath;

  @Index()
  late DateTime createdTime;

  @Index()
  late DateTime modifiedTime;
  
  late String title;
  late String location;

  @Index()
  late bool hasSync;
}