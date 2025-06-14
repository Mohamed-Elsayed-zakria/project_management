import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class LoginTakeData extends StatelessWidget {
  const LoginTakeData({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccess = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: Form(
            key: blocAccess.formKeyLogin,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.getEmail,
                  keyboardType: TextInputType.text,
                  label: "البريد الالكتروني",
                  hintText: "ادخل البريد الالكتروني",
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else if (!EmailValidator.validate(value)) {
                      return "البريد الالكتروني غير صالح";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.getPassword,
                  label: "كلمة المرور",
                  hintText: "ادخل كلمة المرور",
                  prefixIcon: const Icon(Icons.lock_outline),
                  obscureText: blocAccess.passwordVisibility,
                  suffixIcon: IconButton(
                    onPressed: () => blocAccess.showPasswordVisibility(),
                    icon: blocAccess.passwordVisibility
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
