import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import 'site_receipt_add_forms_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class ProjectDetailsSiteReceiptHeader extends StatelessWidget {
  const ProjectDetailsSiteReceiptHeader({super.key});

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
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
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
