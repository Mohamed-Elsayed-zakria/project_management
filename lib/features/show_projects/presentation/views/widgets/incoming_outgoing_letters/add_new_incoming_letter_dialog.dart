import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'add_new_letter_type_letter.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class AddNewIncomingLetterDialog extends StatelessWidget {
  const AddNewIncomingLetterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة خطاب وارد",
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
              label: "الرقم",
              hintText: "ادخل الرقم",
              validator: (value) {
                if (value!.isEmpty) {
                  return "مطلوب";
                } else {
                  return null;
                }
              },
            ),
            CustomFormField(
              label: "التاريخ",
              hintText: "ادخل التاريخ",
              validator: (value) {
                if (value!.isEmpty) {
                  return "مطلوب";
                } else {
                  return null;
                }
              },
            ),
            CustomFormField(
              label: "الموضوع",
              hintText: "ادخل الموضوع",
              validator: (value) {
                if (value!.isEmpty) {
                  return "مطلوب";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            const AddNewLetterTypeLetter(),
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
