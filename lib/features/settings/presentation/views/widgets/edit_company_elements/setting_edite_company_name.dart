import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_company_info.dart';
import 'package:flutter/material.dart';

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
            builder: (context) => SettingCustomDialogEditCompanyInfo(
              title: "اسم الشركة",
              hintText: "ادخل اسم الشركة الجديدة",
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
