// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_structure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineStructureAdapter extends TypeAdapter<TimelineStructure> {
  @override
  final int typeId = 1;

  @override
  TimelineStructure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineStructure(
      activityID: fields[0] as String?,
      activityName: fields[1] as String?,
      start: fields[2] as String?,
      finish: fields[3] as String?,
      actualStart: fields[4] as String?,
      actualFinish: fields[5] as String?,
      complete: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineStructure obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.activityID)
      ..writeByte(1)
      ..write(obj.activityName)
      ..writeByte(2)
      ..write(obj.start)
      ..writeByte(3)
      ..write(obj.finish)
      ..writeByte(4)
      ..write(obj.actualStart)
      ..writeByte(5)
      ..write(obj.actualFinish)
      ..writeByte(6)
      ..write(obj.complete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineStructureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
