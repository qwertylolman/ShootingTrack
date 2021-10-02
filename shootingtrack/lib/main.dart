import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shootingtrack/app/shooting_track_app.dart';
import 'package:shootingtrack/di/di.dart';

void main() async {
  await Hive.initFlutter();
  registerDependencies();
  runApp(const ShootingTrackApp());
}
