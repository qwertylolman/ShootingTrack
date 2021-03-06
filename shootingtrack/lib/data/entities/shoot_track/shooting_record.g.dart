// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shooting_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShootingRecordAdapter extends TypeAdapter<ShootingRecord> {
  @override
  final int typeId = 5;

  @override
  ShootingRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShootingRecord(
      id: fields[0] as String,
      weapon: fields[1] as Weapon,
      timestamp: fields[2] as DateTime,
      bulletsFired: fields[3] as int,
      description: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShootingRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.weapon)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.bulletsFired)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShootingRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
