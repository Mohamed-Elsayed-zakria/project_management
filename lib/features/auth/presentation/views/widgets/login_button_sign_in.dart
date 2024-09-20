import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import '/features/auth/data/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class LoginButtonSignIn extends StatelessWidget {
  const LoginButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccess = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          blocAccess.getEmail.clear();
          blocAccess.getPassword.clear();
          AppPages.off(
            path: AppRoutes.home,
            context: context,
          );
        }
        if (state is LoginFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is LoginLoading,
          onPressed: () {
            if (blocAccess.formKeyLogin.currentState!.validate()) {
              LoginModel loginModel = LoginModel(
                email: blocAccess.getEmail.text,
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
