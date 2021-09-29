import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Model {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Model({
    required this.id,
    required this.name,
  });
}