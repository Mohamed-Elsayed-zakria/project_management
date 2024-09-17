import '../setting_custom_dialog_edit_info.dart';
import 'package:flutter/material.dart';

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
              hintText: "ادخل الموقع الالكتروني الجديد",
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
