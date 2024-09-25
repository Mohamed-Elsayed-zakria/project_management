import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsFormShapeListTile extends StatelessWidget {
  final ProjectDetails projectDetails;
  final String title;
  final String subtitle;
  final Function() guidanceLetterOnTap;
  final Function() outgoingIncomingLettersOnTap;

  const ProjectDetailsFormShapeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.guidanceLetterOnTap,
    required this.outgoingIncomingLettersOnTap,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: outgoingIncomingLettersOnTap,
              child: Text(
                "عرض الخطابات الصادرة والواردة",
                style: AppStyle.tabTextStyle.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          )
        ],
      ),
      trailing: InkWell(
        onTap: guidanceLetterOnTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "النموذج",
            style: AppStyle.tabTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
