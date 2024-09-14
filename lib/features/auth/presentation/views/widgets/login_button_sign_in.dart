import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import '/features/home/presentation/views/home_view.dart';
import '/features/auth/data/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }
        if (state is LoginFailure) {
          ShowToast.show(msg: state.errMessage);
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
          text: "Login",
        );
      },
    );
  }
}
