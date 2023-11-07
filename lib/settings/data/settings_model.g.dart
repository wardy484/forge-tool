// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 0;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel()
      ..name = fields[0] as String
      ..apiKey = fields[1] as String
      ..autoCleanup = fields[2] == null ? true : fields[2] as bool
      ..launchAtStartup = fields[3] == null ? true : fields[3] as bool
      ..licenseKey = fields[4] == null ? '' : fields[4] as String
      ..email = fields[6] == null ? '' : fields[6] as String
      ..hasValidLicense = fields[7] == null ? false : fields[7] as bool
      ..dateVerified = fields[8] as DateTime?
      ..firstLaunched = fields[9] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.apiKey)
      ..writeByte(2)
      ..write(obj.autoCleanup)
      ..writeByte(3)
      ..write(obj.launchAtStartup)
      ..writeByte(4)
      ..write(obj.licenseKey)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.hasValidLicense)
      ..writeByte(8)
      ..write(obj.dateVerified)
      ..writeByte(9)
      ..write(obj.firstLaunched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
