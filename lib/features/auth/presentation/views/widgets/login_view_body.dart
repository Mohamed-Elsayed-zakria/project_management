import 'package:flutter/material.dart';
import '/core/constant/style.dart';
import 'login_button_sign_in.dart';
import 'login_take_data.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "تسجيل الدخول",
            style: AppStyle.kTextStyle30,
          ),
          SizedBox(height: 20),
          LoginTakeData(),
          LoginButtonSignIn(),
        ],
      ),
    );
  }
}
