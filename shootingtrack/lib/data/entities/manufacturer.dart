import 'package:hive/hive.dart';

part 'manufacturer.g.dart';

@HiveType(typeId : 2)
class Manufacturer extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Manufacturer({
    required this.id,
    required this.name,
  });
}