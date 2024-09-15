import 'package:flutter/material.dart';

class SettingCompanyFileItem extends StatelessWidget {
  final String fileName;
  const SettingCompanyFileItem({
    super.key,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(fileName),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
