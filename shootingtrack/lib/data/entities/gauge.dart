import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Gauge {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Gauge({
    required this.id,
    required this.name});
}