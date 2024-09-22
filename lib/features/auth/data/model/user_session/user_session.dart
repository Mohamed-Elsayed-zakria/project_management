import '/core/models/user_credentials.dart';
import '/core/models/enums/user_role.dart';
import 'data.dart';

class UserSession {
  final String? status;
  final Data? data;
  final String? token;

  const UserSession({this.status, this.data, this.token});

  factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'token': token,
      };

  UserCredentials convertToUserCredentials() {
    return UserCredentials(
      username: data?.username,
      email: data?.email,
      role: data?.role == UserRole.admin.name
          ? UserRole.admin.name
          : UserRole.user.name,
      active: data?.active,
      id: data?.id,
      token: token,
      createdAt: data?.createdAt,
      updatedAt: data?.updatedAt,
    );
  }
}
