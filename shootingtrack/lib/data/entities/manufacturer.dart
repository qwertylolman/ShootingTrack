import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Manufacturer {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Manufacturer({
    required this.id,
    required this.name,
  });
}