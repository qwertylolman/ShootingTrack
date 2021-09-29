import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId : 1)
class Model extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Model({
    required this.id,
    required this.name,
  });
}