import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProjectDetailsEditeQuantityBoqDialog extends StatelessWidget {
  const ProjectDetailsEditeQuantityBoqDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "تعديل الكمية",
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
              label: "الكمية الجديدة",
              hintText: "ادخل الكمية الجديدة",
              prefixIcon: Icon(Icons.numbers_outlined),
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'تعديل',
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
