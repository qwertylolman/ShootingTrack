import 'package:hive/hive.dart';

import '../entities.dart';

part 'model.g.dart';

@HiveType(typeId : 1)
class Model extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  Manufacturer manufacturer;

  Model({
    required this.id,
    required this.name,
    required this.manufacturer,
  });
}