import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import '/features/auth/data/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class LoginButtonSignIn extends StatelessWidget {
  const LoginButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccess = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          blocAccess.getUserName.clear();
          blocAccess.getPassword.clear();
          AppPages.off(
            path: AppRoutes.home,
            context: context,
          );
        }
        if (state is LoginFailure) {
          // TODO: create toast
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is LoginLoading,
          onPressed: () {
            if (blocAccess.formKeyLogin.currentState!.validate()) {
              LoginModel loginModel = LoginModel(
                username: blocAccess.getUserName.text,
                password: blocAccess.getPassword.text,
              );
              blocAccess.login(loginModel: loginModel);
            }
          },
          text: "تسجيل الدخول",
        );
      },
    );
  }
}
