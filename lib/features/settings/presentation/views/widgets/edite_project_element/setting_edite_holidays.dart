import 'package:flutter/material.dart';

class SettingEditeHolidays extends StatelessWidget {
  const SettingEditeHolidays({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("الاجازات الرسمية"),
      subtitle: const Text("الجمعة ,السبت"),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit_outlined,
          color: Colors.green,
        ),
      ),
    );
  }
}
