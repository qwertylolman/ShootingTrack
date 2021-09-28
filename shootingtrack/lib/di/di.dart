import 'package:get_it/get_it.dart';
import 'package:shootingtrack/domain/repositories/gauges_repository.dart';
import 'package:shootingtrack/domain/repositories/weapons_repository.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton(WeaponsRepository());
  getIt.registerSingleton(GaugesRepository());
}