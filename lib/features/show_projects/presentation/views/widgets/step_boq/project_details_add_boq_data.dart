import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProjectDetailsAddBoqData extends StatelessWidget {
  final Function() onPressed;
  const ProjectDetailsAddBoqData({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة جديدة",
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
              label: "الرقم",
              hintText: "ادخل الرقم",
            ),
            const CustomFormField(
              label: "البند",
              hintText: "ادخل البند",
            ),
            const CustomFormField(
              label: "الكمية",
              hintText: "ادخل الكمية",
            ),
            const CustomFormField(
              label: "السعر الافرادي",
              hintText: "ادخل السعر الافرادي",
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'اضافة',
              onPressed: onPressed,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
