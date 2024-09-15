import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_company_info.dart';
import 'package:flutter/material.dart';

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
            builder: (context) => SettingCustomDialogEditCompanyInfo(
              title: "العنوان",
              hintText: "ادخل العنوان الجديد",
              onPressed: () {
                Navigator.pop(context);
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
