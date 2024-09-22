import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class AddBoqDataDialog extends StatelessWidget {
  final Function() onPressed;
  const AddBoqDataDialog({
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
              prefixIcon: Icon(Icons.numbers_outlined),
            ),
            const CustomFormField(
              label: "البند",
              hintText: "ادخل البند",
              prefixIcon: Icon(Icons.list_alt_outlined),
            ),
            const CustomFormField(
              label: "الكمية",
              hintText: "ادخل الكمية",
              prefixIcon: Icon(Icons.production_quantity_limits_outlined),
            ),
            const CustomFormField(
              label: "السعر الافرادي",
              hintText: "ادخل السعر الافرادي",
              prefixIcon: Icon(Icons.price_change_outlined),
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
