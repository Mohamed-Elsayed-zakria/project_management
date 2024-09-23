import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditePhoneNumber extends StatelessWidget {
  const SettingEditePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('رقم الهاتف'),
      subtitle: const Text("1234567890"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              title: 'رقم الهاتف',
              content: const CustomFormField(
                label: 'رقم الهاتف',
                hintText: "ادخل رقم الهاتف الجديد",
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
