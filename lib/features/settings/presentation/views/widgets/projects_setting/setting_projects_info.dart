import '/features/settings/presentation/views/widgets/edite_project_element/setting_edite_tax.dart';
import 'package:flutter/material.dart';
import 'setting_projects_title.dart';

class SettingProjectsInfo extends StatelessWidget {
  const SettingProjectsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingProjectsTitle(),
        Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: const Column(
            children: [
              SettingEditeTax(),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
