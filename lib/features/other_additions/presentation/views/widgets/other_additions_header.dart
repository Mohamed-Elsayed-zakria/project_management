import 'other_additions_add_addition_button.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class OtherAdditionsHeader extends StatelessWidget {
  const OtherAdditionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtherAdditionsAddAdditionButton(),
        Divider(
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}
