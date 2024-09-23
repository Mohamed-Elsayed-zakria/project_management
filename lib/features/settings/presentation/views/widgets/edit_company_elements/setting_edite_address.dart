import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditeAddress extends StatelessWidget {
  const SettingEditeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("العنوان"),
      subtitle: const Text("المحلة الكبري"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              title: "العنوان",
              content: const CustomFormField(
                label: "العنوان",
                hintText: "ادخل العنوان الجديد",
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
