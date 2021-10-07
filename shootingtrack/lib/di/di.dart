import 'package:get_it/get_it.dart';
import 'package:shootingtrack/domain/repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton(WeaponsRepository());
  getIt.registerSingleton(GaugesRepository());
  getIt.registerSingleton(ManufacturersRepository());
  getIt.registerSingleton(ModelsRepository());
  getIt.registerSingleton(ShootingRecordsRepository());
  getIt.registerSingleton(UserSettingsRepository());
}