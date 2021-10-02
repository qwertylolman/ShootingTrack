import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shootingtrack/app/shooting_track_app.dart';
import 'package:shootingtrack/di/di.dart';

import 'data/entities/entities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();

  registerDependencies();
  runApp(const ShootingTrackApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(WeaponAdapter())
    ..registerAdapter(ManufacturerAdapter())
    ..registerAdapter(ModelAdapter())
    ..registerAdapter(GaugeAdapter());
}
