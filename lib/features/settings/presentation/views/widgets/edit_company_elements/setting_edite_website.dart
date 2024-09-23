import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditeWebsite extends StatelessWidget {
  const SettingEditeWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("الموقع الالكتروني"),
      subtitle: const Text("www.example.com"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              title: "الموقع الالكتروني",
              content: const CustomFormField(
                label: "الموقع الالكتروني",
                hintText: "ادخل الموقع الالكتروني الجديد",
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
