import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class SettingCustomDialogEditCompanyInfo extends StatelessWidget {
  final String title;
  final String hintText;
  final Function() onPressed;
  const SettingCustomDialogEditCompanyInfo({
    super.key,
    required this.title,
    required this.hintText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(12)),
       ),
      title: Text(
        "تعديل $title",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            CustomFormField(
              label: title,
              hintText: hintText,
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'حفظ',
              onPressed: onPressed,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
