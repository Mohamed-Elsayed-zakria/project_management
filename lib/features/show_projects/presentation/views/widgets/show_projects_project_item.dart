import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_details_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class ShowProjectsProjectItem extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ShowProjectsProjectItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Wrap(
                  children: [
                    const Text("اسم المشروع : "),
                    Text("${projectDetails.projectName}"),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(
                    children: [
                      const Text("رقم المشروع : "),
                      Text("${projectDetails.projectNumber}"),
                    ],
                  ),
                ),
                onTap: () {
                  AppPages.to(
                    path: AppRoutes.projectDetails,
                    context: context,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDetailsButton(
                onTap: () => AppPages.to(
                  data: projectDetails,
                  path: AppRoutes.projectInfo,
                  context: context,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
