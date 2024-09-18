import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditeTax extends StatelessWidget {
  const SettingEditeTax({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("ضريبة القيمة المضافة"),
      subtitle: const Text("% 15"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              title: "ضريبة القيمة المضافة",
              hintText: "ادخل الضريبة الجديدة",
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
