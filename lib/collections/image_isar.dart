import 'package:isar/isar.dart';

part 'image_isar.g.dart';

@collection
class ImageIsar {
  Id id = Isar.autoIncrement;
  late String imagePath;

  @Index()
  late DateTime createdTime;

  @Index()
  late bool hasSync;
}