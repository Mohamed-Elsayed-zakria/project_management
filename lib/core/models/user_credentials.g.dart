// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCredentialsAdapter extends TypeAdapter<UserCredentials> {
  @override
  final int typeId = 0;

  @override
  UserCredentials read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCredentials(
      id: fields[0] as String?,
      username: fields[1] as String?,
      email: fields[2] as String?,
      active: fields[3] as bool?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      token: fields[4] as String?,
      role: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredentials obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.active)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
