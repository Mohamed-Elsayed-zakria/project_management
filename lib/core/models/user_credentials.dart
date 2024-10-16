import 'package:isar/isar.dart';
part 'user_credentials.g.dart';

@collection
class UserCredentials {
  Id uId = Isar.autoIncrement;
  String? id;
  String? username;
  String? email;
  bool? active;
  String? token;
  String? role;
  String? createdAt;
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
