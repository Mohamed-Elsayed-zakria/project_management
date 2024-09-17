import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProjectDetailsCreateNewBoqDialog extends StatelessWidget {
  const ProjectDetailsCreateNewBoqDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة جدول معدل جديد",
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
            const CustomFormField(
              label: "اسم الجدول المعدل",
              hintText: "ادخل اسم الجدول",
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'اضافة',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
