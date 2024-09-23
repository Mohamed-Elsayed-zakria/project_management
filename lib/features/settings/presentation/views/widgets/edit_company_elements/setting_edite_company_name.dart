import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditeCompanyName extends StatelessWidget {
  const SettingEditeCompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("اسم الشركة"),
      subtitle: const Text("الشركة الرئيسية"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              title: "اسم الشركة",
              content: const CustomFormField(
                label: "اسم الشركة",
                hintText: "ادخل اسم الشركة الجديدة",
              ),
              onPressed: () {
                AppPages.back(context);
              },
            ),
          );
        },
        icon: const Icon(
          Icons.edit_outlined,
          color: Colors.green,
        ),
      ),
    );
  }
}
