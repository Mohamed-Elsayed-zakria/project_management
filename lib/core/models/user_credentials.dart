import 'package:hive/hive.dart';
part 'user_credentials.g.dart';

@HiveType(typeId: 0)
class UserCredentials extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final bool? active;

  UserCredentials({
    this.id,
    this.username,
    this.password,
    this.active,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'active': active,
      };
}
