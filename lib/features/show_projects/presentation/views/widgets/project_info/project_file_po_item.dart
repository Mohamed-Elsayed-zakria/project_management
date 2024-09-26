import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/constant/api_end_point.dart';
import '/core/utils/url_open_file.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectFilePoItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectFilePoItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("ملف ال - po"),
      trailing: IconButton(
        icon: const Icon(
          Icons.visibility_outlined,
          color: AppColors.kPrimaryColor,
        ),
        onPressed: () async {
          await UrlOpenFile.openFile(
            "${APIEndPoint.mediaBaseUrl}${projectDetails.projectFilePo}",
          );
        },
      ),
    );
  }
}
