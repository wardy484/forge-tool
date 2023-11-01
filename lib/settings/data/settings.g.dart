// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings()
      ..name = fields[0] as String
      ..apiKey = fields[1] as String
      ..autoCleanup = fields[2] == null ? true : fields[2] as bool
      ..launchAtStartup = fields[3] == null ? true : fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.apiKey)
      ..writeByte(2)
      ..write(obj.autoCleanup)
      ..writeByte(3)
      ..write(obj.launchAtStartup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
