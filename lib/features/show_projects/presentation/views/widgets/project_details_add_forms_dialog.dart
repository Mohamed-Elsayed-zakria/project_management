import '/core/widgets/custom_list_tile_validator.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProjectDetailsAddFormsDialog extends StatelessWidget {
  final Function() onPressed;

  const ProjectDetailsAddFormsDialog({
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
        "اضافة عنصر جديد",
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
              label: "وصف النوذج",
              hintText: "ادخل وصف النوذج",
              prefixIcon: Icon(Icons.description_outlined),
            ),
            const CustomFormField(
              label: "رقم النوذج",
              hintText: "ادخل رقم النوذج",
              prefixIcon: Icon(Icons.numbers_outlined),
            ),
            CustomListTileValidator(
              leading: const Icon(Icons.file_copy_outlined),
              title: "ارفاق ملف",
              onTap: () {},
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
