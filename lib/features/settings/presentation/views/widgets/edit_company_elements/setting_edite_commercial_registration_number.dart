import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_company_info.dart';
import 'package:flutter/material.dart';

class SettingEditeCommercialRegistrationNumber extends StatelessWidget {
  const SettingEditeCommercialRegistrationNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("رقم السجل التجاري"),
      subtitle: const Text("1234567890"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditCompanyInfo(
              title: "رقم السجل التجاري",
              hintText: "ادخل رقم السجل التجاري الجديد",
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
