import '/features/show_projects/data/models/project_details/project_details.dart';
import 'project_duration_per_day_item.dart';
import 'project_receipt_date_item.dart';
import 'package:flutter/material.dart';
import 'project_end_date_item.dart';
import 'project_file_po_item.dart';
import 'project_date_po_item.dart';

class ProjectInfoViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectInfoViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("اسم المشروع"),
                      subtitle: Text(
                        projectDetails.projectName ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("رقم المشروع"),
                      subtitle: Text(
                        projectDetails.projectNumber ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مبلغ المشروع"),
                      subtitle: Text(
                        projectDetails.projectPrice ?? '--',
                      ),
                    ),
                    const Divider(),
                    ProjectDurationPerDayItem(projectDetails: projectDetails),
                    const Divider(),
                    ProjectReceiptDateItem(projectDetails: projectDetails),
                    const Divider(),
                    ProjectEndDateItem(projectDetails: projectDetails),
                    const Divider(),
                    ListTile(
                      title: const Text("مدير المشروع"),
                      subtitle: Text(
                        projectDetails.projectManager ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("الجهة المالكة"),
                      subtitle: Text(
                        projectDetails.projectOwner ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المنطقة"),
                      subtitle: Text(
                        projectDetails.projectArea ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المدينة"),
                      subtitle: Text(
                        projectDetails.projectCity ?? '--',
                      ),
                    ),
                    const Divider(),
                    ProjectDatePoItem(projectDetails: projectDetails),
                    const Divider(),
                    ProjectFilePoItem(projectDetails: projectDetails),
                    const Divider(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
