import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';

class ProjectReceiptDateItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectReceiptDateItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("تاريخ استلام المشروع"),
      subtitle: Text(
        MyDateUtil.convertDateTime(
          historyAsText: projectDetails.projectReceiptDate!,
        ),
      ),
    );
  }
}
