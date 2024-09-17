import '/core/widgets/form_divider.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class SettingProjectsTitle extends StatelessWidget {
  const SettingProjectsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "المشاريع",
            style: AppStyle.kTextStyle20,
          ),
          SizedBox(height: 5),
          FormDivider(
            width: 80,
          ),
        ],
      ),
    );
  }
}
