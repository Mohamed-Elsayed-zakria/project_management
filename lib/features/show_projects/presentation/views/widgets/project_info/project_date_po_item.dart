import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/constant/colors.dart';

class ProjectDatePoItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDatePoItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("تاريخ ال - po"),
      subtitle: Text(
        MyDateUtil.convertDateTime(
          historyAsText: projectDetails.projectDatePo!,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit_outlined,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
