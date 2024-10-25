import '/core/widgets/custom_alert_dialog.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class SettingCustomDialogEditInfo extends StatelessWidget {
  final String title;
  final Widget content;
  final Function() onPressed;
  final bool isLoading;
  const SettingCustomDialogEditInfo({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "تعديل $title",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          content,
          const SizedBox(height: 10),
          CustomButton(
            text: 'حفظ',
            onPressed: onPressed,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
