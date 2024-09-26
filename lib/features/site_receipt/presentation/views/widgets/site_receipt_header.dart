import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'site_receipt_add_forms_button.dart';
import '/core/models/enums/step_type.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class ProjectDetailsSiteReceiptHeader extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectDetailsSiteReceiptHeader({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SiteReceiptAddFormsButton(
              projectDetails: projectDetails,
              stepType: StepType(
                stepType: StepTypeName.siteReceipt.name,
              ),
            ),
            ProjectDetailsAddOnsLetters(
              mainAxisAlignment: MainAxisAlignment.end,
              otherAdditionsOnTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(
                    stepType: StepTypeName.siteReceipt.name,
                  ),
                ),
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(
                    stepType: StepTypeName.siteReceipt.name,
                  ),
                ),
                path: AppRoutes.incomingOutgoingLetters,
                context: context,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
