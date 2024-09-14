import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/data/repository/login_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginImplement()),
        child: const LoginViewBody(),
      ),
    );
  }
}
