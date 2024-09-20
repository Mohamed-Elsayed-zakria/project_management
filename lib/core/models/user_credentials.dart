import 'package:hive/hive.dart';
part 'user_credentials.g.dart';

@HiveType(typeId: 0)
class UserCredentials extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  bool? active;
  @HiveField(4)
  String? token;
  @HiveField(5)
  String? role;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;

  UserCredentials({
    this.id,
    this.username,
    this.email,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.role,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'active': active,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'token': token,
        'role': role,
      };
}
