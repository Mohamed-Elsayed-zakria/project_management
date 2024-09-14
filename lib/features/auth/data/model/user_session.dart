class UserSession {
  final String userName;
  final String password;
  final bool isActive;
  final String roles;

  const UserSession({
    required this.userName,
    required this.password,
    required this.isActive,
    required this.roles,
  });
}
