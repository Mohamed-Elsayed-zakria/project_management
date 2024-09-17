import 'package:flutter/material.dart';
import 'package:project_management/core/constant/colors.dart';
import 'package:project_management/core/constant/style.dart';

import 'project_details_create_new_boq_dialog.dart';

class ProjectDetailsCreateNewBoqButton extends StatelessWidget {
  const ProjectDetailsCreateNewBoqButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProjectDetailsCreateNewBoqDialog(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "اضافة جدول معدل جديد",
              style: AppStyle.tabTextStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
