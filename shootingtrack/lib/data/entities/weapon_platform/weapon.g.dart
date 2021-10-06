// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeaponAdapter extends TypeAdapter<Weapon> {
  @override
  final int typeId = 0;

  @override
  Weapon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weapon(
      id: fields[0] as String,
      name: fields[1] as String,
      manufacturer: fields[2] as Manufacturer,
      model: fields[3] as Model,
      gauge: fields[4] as Gauge,
    );
  }

  @override
  void write(BinaryWriter writer, Weapon obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.manufacturer)
      ..writeByte(3)
      ..write(obj.model)
      ..writeByte(4)
      ..write(obj.gauge);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeaponAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
