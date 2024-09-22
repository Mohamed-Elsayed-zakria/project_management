import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'forms_add_form_button.dart';

class FormsHeader extends StatelessWidget {
  const FormsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormsAddFormButton(),
        Divider(
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}
