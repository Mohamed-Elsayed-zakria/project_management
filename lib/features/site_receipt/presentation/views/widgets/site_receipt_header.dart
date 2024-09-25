import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'site_receipt_add_forms_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
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
            const SiteReceiptAddFormsButton(),
            ProjectDetailsAddOnsLetters(
              mainAxisAlignment: MainAxisAlignment.end,
              otherAdditionsOnTap: () => AppPages.to(
                data: projectDetails,
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
                data: projectDetails,
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
