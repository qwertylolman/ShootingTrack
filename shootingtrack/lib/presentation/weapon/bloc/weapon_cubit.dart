import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/domain/domain.dart';
import 'package:shootingtrack/presentation/weapon/bloc/weapon_state.dart';

class WeaponCubit extends Cubit<WeaponState> {
  WeaponCubit({
    required this.weaponsRepository,
    required this.gaugesRepository,
    required this.modelsRepository,
    required this.manufacturersRepository,
    required this.shootingRecordsRepository,
  }) : super(const WeaponState.initial());

  final WeaponsRepository weaponsRepository;
  final GaugesRepository gaugesRepository;
  final ModelsRepository modelsRepository;
  final ManufacturersRepository manufacturersRepository;
  final ShootingRecordsRepository shootingRecordsRepository;

  Future<void> onInit(String? weaponId) async {
    emit(const WeaponState.loading());

    var weapon = await weaponsRepository.read(weaponId);
    if (weapon == null) {
      emit(const WeaponState.empty());
    } else {
      emit(WeaponState.success(
          weapon: weapon,
      ));
    }
  }

  Future<void> createWeapon(
      String name,
      String manufacturerName,
      String modelName,
      String gaugeName,
      ) async {
    var manufacturer = await getManufacturer(manufacturerName);
    var model = await getModel(modelName, manufacturer);
    var gauge = await getGauge(gaugeName);

    await weaponsRepository.createWeapon(name, manufacturer, model, gauge);
  }

  Future<void> updateWeapon(
      String id,
      String name,
      String manufacturerName,
      String modelName,
      String gaugeName
      ) async {
    var manufacturer = await getManufacturer(manufacturerName);
    var model = await getModel(modelName, manufacturer);
    var gauge = await getGauge(gaugeName);
    var weapon = (await weaponsRepository.read(id))!;

    weapon.manufacturer = manufacturer;
    weapon.model = model;
    weapon.gauge = gauge;
    weapon.name = name;

    await weaponsRepository.update(weapon.id, weapon);
  }

  Future<void> deleteWeapon(
      String id,
      ) async {
    var weapon = await weaponsRepository.read(id);
    if (weapon != null) {
      await shootingRecordsRepository.deleteRecordsForWeapon(weapon);
      await weaponsRepository.delete(id);
    }
  }

  Future<Iterable<Manufacturer>> getManufacturers(String query) async {
    var manufacturers = await manufacturersRepository.readAll();
    if (query.isEmpty) {
      return manufacturers;
    }

    return manufacturers.where((e) => e.name.contains(query));
  }

  Future<Manufacturer> getManufacturer(String name) async {
    var manufacturer = await manufacturersRepository.getByName(name)
        ?? await manufacturersRepository.createManufacturer(name);

    // normalize names
    // names can be matched ignoring case, but user may do some adjustments
    if (manufacturer.name != name) {
      manufacturer.name = name;
      manufacturersRepository.update(manufacturer.id, manufacturer);
    }

    return manufacturer;
  }

  Future<Iterable<Model>> getModels(String query) async {
    var models = await modelsRepository.readAll();
    if (query.isEmpty) {
      return models;
    }

    return models.where((e) => e.name.contains(query));
  }

  Future<Model> getModel(
      String name,
      Manufacturer manufacturer) async {
    var model = await modelsRepository.getByNameAndManufacturer(name, manufacturer.id)
        ?? await modelsRepository.createModel(name, manufacturer);

    // normalize names
    // names can be matched ignoring case, but user may do some adjustments
    if (model.name != name) {
      model.name = name;
      modelsRepository.update(model.id, model);
    }

    return model;
  }

  Future<Iterable<Gauge>> getGauges(String query) async {
    var gauges = await gaugesRepository.readAll();
    if (query.isEmpty) {
      return gauges;
    }

    return gauges.where((e) => e.name.contains(query));
  }

  Future<Gauge> getGauge(String name) async {
    var gauge = await gaugesRepository.getByName(name)
        ?? await gaugesRepository.createGauge(name);

    // normalize names
    // names can be matched ignoring case, but user may do some adjustments
    if (gauge.name != name) {
      gauge.name = name;
      gaugesRepository.update(gauge.id, gauge);
    }

    return gauge;
  }
}