import '/features/auth/presentation/views/login_view.dart';
import '/features/home/presentation/views/home_view.dart';
import 'core/models/user_credentials.dart';
import 'core/services/auth_services.dart';
import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return checkUserIsLogin() ? const HomeView() : const LoginView();
  }

  bool checkUserIsLogin() {
    UserCredentials? credentials = AuthServices.readCredentials();
    if (credentials != null &&
        credentials.token != null &&
        credentials.token!.isNotEmpty) {
      return true;
    }
    return false;
  }
}
