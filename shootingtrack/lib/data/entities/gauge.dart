import 'package:hive/hive.dart';

part 'gauge.g.dart';

@HiveType(typeId : 3)
class Gauge extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Gauge({
    required this.id,
    required this.name,
  });
}