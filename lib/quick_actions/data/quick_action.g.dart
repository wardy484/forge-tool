// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuickActionAdapter extends TypeAdapter<QuickAction> {
  @override
  final int typeId = 1;

  @override
  QuickAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuickAction()
      ..name = fields[0] as String
      ..ports = (fields[1] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, QuickAction obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ports);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuickActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
